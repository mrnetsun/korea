<?php
/**
* @name FormValidate
* @author Do Luc <lucdt@ideavietnam.com>
*/

/**
 * rules
 * not_empty
 * is_numeric
 * is_email
 * is_checked
 */

class FormValidate {

	/**
	 * Rules holder
	 *
	 * @var array
	 */
	private $_rules;

	/**
	 * Return valid form
	 *
	 * @var boolean
	 */
	private $validate = true;

	/**
	 * Holder of error msg's
	 *
	 * @var array
	 */
	private $error_msgs;
	
	/**
	 * @var array
	 */
	private $_errors = array(
			'not_empty' => "[%s] is required.",
			'required' => "[%s] is required.",
			'is_numeric' => "[%s] is numberic value.",
			'is_email' => "[%s] is invalid.",		
			
			);

	public function setRules($rules) {
		$this->_rules = $rules;
	}
	
	/**
	* Main method to trigger validation
	*
	* @return boolean
	*/
	public function validate($aryData) {
		foreach ($aryData as $key => $val) {
			if ($skey = $this->hasRule($key)) {
				
				$rules = explode('|',$this->_rules[$key]['rule']);
				foreach($rules as $rule){
					
				if (method_exists($this, $rule)) {
					if (!call_user_func(array($this,$rule), $val)) {
						
						$this->validate = false;
						
						if($this->_rules[$key]['msg']){
							$this->error_msgs[] = $this->_rules[$key]['msg'];
							
						}else{
														
							$this->error_msgs[] = sprintf($this->_errors[$rule],$key);
						}
					}
				} else {
					$this->error_msgs[] = __("Unsuported metod {$rule['rule']}");
				}
				}
			}
		}

		return $this->validate;
	}
	
	/*
	* Method to check if rule exists
	*
	* @return boolean
	*/
	private function hasRule($key) {
		if (!is_array($this->_rules) OR count($this->_rules) < 1) { return false; }
		return ($this->_rules[$key])?true:false;
	}

	public function getErrorMsg() {
		return $this->error_msgs;
	}

	/**
	 * Method to check if value is empty
	 *
	 * @return boolean
	 */
	private function not_empty($field = null) {
		return (!empty($field) OR !strlen(trim($field)) < 1);
	}
	
	/**
	 * Method to check if value is empty
	 *
	 * @return boolean
	 */
	private function required($field = null) {
		return $this->not_empty($field);
	}
	
	/**
	 * Method to check if value is numeric
	 *
	 * @return boolean
	 */
	private function is_numeric($field = null) {
		return (is_numeric($field));
	}
	
	/**
	 * Method to check if value is email
	 *
	 * @return boolean
	 */
	private function is_email($field) {
		return preg_match('|^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]{2,})+$|i', $field);
	}
	
	/**
	 * Method to check if value is checked
	 *
	 * @return boolean
	 */
	private function is_checked($field = null) {
		return (!is_null($field));
	}
}
?>
