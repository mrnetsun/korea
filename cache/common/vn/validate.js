/*
 * validate.js
 * Copyright (c) 2013 Lucdt@ideavietnam.com
 */

var FormValidate = function () {};

FormValidate.prototype = {

	callback: function() {
		var ok = true;
		if (typeof FormValidateCallBack[this.formName] === 'function') {
			ok =  FormValidateCallBack[this.formName]();
		}
		return ok;
    },
    /*
     * Define the regular expressions that will be used
     */

	ruleRegex : /^(.+)\[(.+)\]$/,
	numericRegex : /^[0-9]+$/,
	integerRegex : /^\-?[0-9]+$/,
	floatRegex	:/^\d*\.?\d*$/,
	decimalRegex : /^\-?[0-9]*\.?[0-9]+$/,
	emailRegex : /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$/i,
	alphaRegex : /^[a-z]+$/i,
	alphaNumericRegex : /^[a-z0-9]+$/i,
	alphaDashRegex : /^[a-z0-9_-]+$/i,
	naturalRegex : /^[0-9]+$/i,
	naturalNoZeroRegex : /^[1-9][0-9]*$/i,
	ipRegex : /^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})$/i,
	base64Regex : /[^a-zA-Z0-9\/\+=]/i,
    timeSlot: /[0,1][0-9]:[0-6][0-9]/i,
	urlRegex : /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/,
    javaClassName: /^[a-z0-9A-Z._]+$/i,
	noSpace:/^[a-zA-Z0-9()._\-\\#\/!:.?+=&%@!]+$/i,
	//passwordSpecial:/^(?=.*\d)(?=.*[a-z])[0-9a-z]{6,}$/i,
	passwordSpecial: /^(?=.*[\~\@\#\,\.\$\%\^\&\*\(\)\{\}\_\+\-\=\!\.\`])[a-z0-9\~\@\#\$\%\^\&\*\(\)\{\}\_\+\-\=\`\.\!]{6,}$/i,
	///^(?=.*\w)(?=.*[!@#$%^&*()-_+])[!@#$%^&*()-_+\w\d]{6,}$/i,
	//alphaSpaceRegex : /^[a-z\s]+$/i,
	//alphaSpaceRegex : /^([a-zA-Z]+\s)*[a-zA-Z]+$/i,
	alphaSpaceRegex : /[\`\~\,\.\<\@#\$!\%\)\*\^\(\>\;\&\/\\\?\'\:\"\[\|\{\}\=_\+\-\]+\d]+$/i,///[`~,.<@#$!%)(>;':"\[\|{}()=_+-\]+\s\d]+$/i,
	someSpecialCharacters : /[\`\~\<\@#\$!\%\)\(\>\;\:\[\]\|\{\}\=_\+\-\\\^\*\/\?]/i,
	someSpecialCharacters_except_slash : /[\`\~\<\@#\$!\%\)\(\>\;\:\[\]\|\{\}\=_\+\-\\\^\*\?]/i,
	///^([`~,.<@#$!%)(>;':"[\]|{}()=_+-]+\s)*[0-9`~,.<@)(!$%#>;':"[\]|{}()=_+-]+$/i,
	isNullOrWhitespace: /^(?!\s*$).+/i,
	fileImage: /\.(jpe?g|png|gif|bmp)$/i,
	commaOnly:/^[,]+$/i,
	txtFile: /\.(txt)$/i,
	phoneRegex: /^[\s()+-]*([0-9][\s()+-]*){6,20}$/,

    /*
     * Init validator and Bind rule to form element:
     *
    */

	 bindEventRules:function(formName, callback){
		this.callback = callback || this.callback;
        this.errors = [];
        this.fields = [];
        this.groups = [];
        this.form = document.forms[formName] || {};
		this.formName = formName;
        this.messages = {};
        this.handlers = {};

		this.messages = [];
		this.messages['required'] = 'Dữ liệu bắt buộc';
		this.messages['required_trim'] = 'Dữ liệu bắt buộc';
		this.messages['matches'] = 'Trường %s không khớp với trường %s.';
		this.messages['matches_different'] = 'The %s field must be different the %s field.';
		this.messages['valid_email'] = 'Email sai định dạng.';
		this.messages['valid_emails'] = 'Trường %s phải là các email.';
		this.messages['min_length'] = 'Trường %s phải có ít nhất %s ký tự.';
		this.messages['max_length'] = 'The %s field must not exceed %s characters in length.';
		this.messages['exact_length'] = 'Trường %s phải có chính xác %s ký tự.';
		this.messages['greater_than'] = 'Trường %s phải có giá trị lớn hơn %s.';
		this.messages['less_than'] = 'Trường %s phải có giá trị nhỏ hơn %s.';
		this.messages['greater_date_than'] = 'Trường %s phải là ngày lớn hơn %s.';
		this.messages['less_date_than'] = 'Trường %s phải là ngày nhỏ hơn %s.';
		this.messages['alpha'] = 'Trường %s chỉ bao gồm ký tự chữ.';
		this.messages['alpha_numeric'] = 'Trường %s chỉ bao gồm ký tự hoặc số.';
		this.messages['alpha_dash'] = 'Trường %s chỉ bao gồm ký tự, số, _ và -';
		this.messages['numeric'] = 'Trường chỉ chứa số.';
		this.messages['integer'] = 'Trường %s phải là số nguyên.';
		this.messages['decimal'] = 'Trường %s phải là một số thập phân.';
		this.messages['is_natural'] = 'Trường %s phải là một số âm';
		this.messages['is_natural_no_zero'] = 'Trường %s phải là số lớn hơn 0.';
		this.messages['valid_ip'] = 'Trường %s phải là một IP.';
		this.messages['valid_base64'] = 'Trường %s phải là một chuỗi base64.';
		this.messages['min_check'] = 'Bạn phải chọn ít nhất %s lựa chọn.';
		this.messages['max_check'] = 'Bạn chỉ được chọn tối đa %s lựa chọn.';
		this.messages['url'] = 'Trường %s phải là một webiste URL.';
		this.messages['float'] = 'Trường %s phải là một số thập phân.';
		this.messages['valid_slot'] = 'Trường %s sai định dạng.';
        this.messages['valid_name'] = 'Trường %s phải không chứa dấu cách và ký tự đặc biệt.';
		this.messages['no_space'] = 'Trường %s phải không chứa dấu cách.';
		this.messages['password_special'] = 'Trường %s phải chứa cả ký tự đặc biệt, chữ thường và số.';
		this.messages['alpha_space'] = 'Trường %s phải chứa chữ cái.';
		this.messages['isnull_or_white_space'] = 'The field is required.';
		this.messages['unlike'] = 'Trường phải không giống các trường khác.';
		this.messages['valid_image'] = 'Trường %s phải chứa jpeg,png,gif hoặc bmp.';

		this.messages['no_comma'] = 'The %s field must contain at least 2 words.';
		this.messages['no_special_character'] = 'Trường %s phải không chứa ký tự đặc biệt.';

		this.messages['valid_image'] = 'Trường %s phải chứa jpeg,png,gif hoặc bmp.';
		this.messages['min_unit'] = 'The Similar type must contain at least 2 word or phrase.';
		this.messages['unlike_group'] = 'This options must unlike with one of other field.';
		this.messages['txt_file'] = 'Loại file phải là .txt';
		this.messages['no_special_ex_slash'] = 'This word is invalid.';
		 this.messages['phone_number'] ='Số điện thoại không đúng';


		var validFormObj = this;

		// check group
		var groups = $(document.forms[formName]).find('.inputGroup');
		for (var i = 0, fieldLength = groups.length; i < fieldLength; i++) {
			 var group = groups[i];
			 if (!$(group).attr("rules")) {
	                continue;
	         }

			//make require symbol
            if ($(group).attr("rules").indexOf('required') !== -1){

            	elementLabel = $(group).parent().prev('label');

            	if(!elementLabel.children().last().hasClass('required')){
            		elementLabel.append('<span class="required">*</span>');
            	}
            }

            this.groups.push($(group));

            $(group).find('input').unbind("change");
			$(group).find('input').change(function(){

				validFormObj._validateGroup($(this).closest('div'));

			});

		}

		var fields = document.forms[formName].elements;

        if(fields)for (var i = 0, fieldLength = fields.length; i < fieldLength; i++) {
            var field = fields[i];

            // If passed in incorrectly, we need to skip the field.
            if (!$(field).attr("name") || !$(field).attr("rules")) {
                continue;
            }

            //make require symbol
            if ($(field).attr("rules").indexOf('required') !== -1){

            	elementLabel = $(field).parent().prev('label');

            	if(!elementLabel.children().last().hasClass('required')){
            		elementLabel.append('<span class="required">*</span>');
            	}
            }

            /*
             * Build the master fields array that has all the information needed to validate
             */
            this.fields.push($(field));
			//bind keyup
			$(field).unbind("keyup");
			$(field).keyup(function(){
				validFormObj._validateField(this);
			});
			$(field).unbind("change");
			$(field).change(function(){
				validFormObj._validateField(this);
			});
        }
	},

	/**
	 * Do valid a form
	 */
     validator : function(formName, callback) {

		this.bindEventRules(formName, callback);

		var ok = this._validateForm();

		return ok;

	 },
    /*
     * @public
     * Sets a custom message for one of the rules
     */

     setMessage : function(rule, message) {
        this.messages[rule] = message;
    },

    /*
     * @public
     * Registers a callback for a custom rule (i.e. callback_username_check)
     */

   registerCallback : function(name, handler) {
        if (name && typeof name === 'string' && handler && typeof handler === 'function') {
            this.handlers[name] = handler;
        }
    },

    /**
     * Display a Error
     */
    _error: function(field,message){
    	field = $(field);
    	var nextObj = field.next();

    	if(field.hasClass('tagsInput')){
    		field.closest('.controls').find('.bootstrap-tagsinput').addClass('input_error');
	    }else if(field.hasClass('buttonSelect')){
			field.closest('.controls').find('button.multiselect').addClass('input_error');
		}else{

	    	field.addClass('input_error');
	    }

    	field.parent().find('.tooltip').remove();

		if(!nextObj.hasClass('field_error')){

			if(typeof(field.attr('msg'))!='undefined'){
				message = field.attr('msg');
			}

			if(message && message.replace(' ','')!=''){
				message = message.replace(/_/g,' ');
				var obj_error = $('<span class="field_error pointer add-on" title="'+message+'">?</span>');
				obj_error.tooltip('toggle');
				field.after(obj_error);
			}
			//field.focus();
		}else{
			field.next().attr('title',message);
		}
    },

    /*
     * @private
     * Runs the validation when the form is submitted.
     */

   _validateForm : function(event) {
        this.errors = [];

		var ok = true;
		var element = null;

		//valid group
		while(element = this.groups.pop()){
			this._validateGroup(element);
		}

		//valid field
		while(element = this.fields.pop()){
			this._validateField(element);
		}

        if (typeof this.callback === 'function') {
			ok = this.callback(this.formName, event);
        }

        if (this.errors.length > 0) {
            ok = false;

        	try{
        		var error = this.errors.pop();
            	error.field.focus();
        	}catch(e){
        		LBL_DISPLAY_TO(e.toString());
        	}


        }

        //check callback field error        
        $('#'+this.formName).find('.callback_error').each(function(){ok = false;});

        return ok;
    },

    /*
     * @private
     * Looks at the group value and evaluates it against the given rules
     */
    _validateGroup: function(field){
    	field = $(field);
    	//clear error state
		field.parent().find('.tooltip').remove();
		field.removeClass('input_error');
		var nextObj = field.next();
		if(nextObj.hasClass('field_error')){
			nextObj.remove();
		}

		/*
		 * if field has parrent is hidden don't run validate
		 */
		if(field.closest(':hidden').length > 0){
			return;
		}

		//check all rules
        var rules = field.attr("rules").split('|');
        /*
         * If the value is null and not required, we don't need to run through validation
         */
        //LBL_DISPLAY_TO(field.attr("id"));

        if (field.attr("rules").indexOf('required') === -1) {
            return;
        }

        /*
         * Run through the rules and execute the validation methods as needed
         */
		ruleLength = rules.length;

        for (var i = 0; i < ruleLength; i++) {

        	var method = rules[i],
            param = null,
            failed = true;
	        /*
	         * If the rule has a parameter (i.e. matches[param]) split it out
	         */

	        if (parts = this.ruleRegex.exec(method)) {
	            method = parts[1];
	            param = parts[2];
	        }
        	//LBL_DISPLAY_TO(param);
            switch(method){
            	case 'required':

            		field.find('input:checked').each(function(){
            			failed = false;
            		});

            		break;

            	case 'min_check':
            		var count = field.find('input:checked').length;

            		if(count >= param) failed = false;

            		break;
            	case 'max_check':

            		var count = field.find('input:checked').length;

            		if(count <= param) failed = false;

            		break;
            }

            //LBL_DISPLAY_TO(failed);
    		if(failed){

    			var source = this.messages[method];
                if (source) {

                    if (param) {
                    	message = source.replace('%s', param);
                    }else{
                    	message = source.replace('%s', param);
                    }

                    this._error(field,message);

                }

                this.errors.push({
                    field: field,
                    message: message
                });
    		}
        }



    },

    /*
     * @private
     * Looks at the fields value and evaluates it against the given rules
     */

    _validateField : function(field) {
		field  = $(field);

		//clear error state
		field.parent().find('.tooltip').remove();
		field.removeClass('input_error');

		if(field.hasClass('tagsInput')){
    		field.closest('.controls').find('.bootstrap-tagsinput').removeClass('input_error');
	    }

		if(field.hasClass('buttonSelect')){
			field.closest('.controls').find('button.multiselect').removeClass('input_error');
		}

		var nextObj = field.next();
		if(nextObj.hasClass('field_error')){
			nextObj.remove();
		}

		/*
		 * if field has parrent is hidden don't run validate
		 */

		if(field.closest(':hidden').length > 0){
			if(!field.hasClass('tagsInput') && !field.hasClass('buttonSelect')){

				return;
			}

		}



		//check all rules
        var rules = field.attr("rules").split('|');
        /*
         * If the value is null and not required, we don't need to run through validation
         */

        if (field.attr("rules").indexOf('required') === -1 && (!field.val() || field.val() === '' || field.val() === undefined)) {
            return;
        }

        /*
         * Run through the rules and execute the validation methods as needed
         */
		ruleLength = rules.length;

        for (var i = 0; i < ruleLength; i++) {
            var method = rules[i],
                param = null,
                failed = false;
            /*
             * If the rule has a parameter (i.e. matches[param]) split it out
             */

            if (parts = this.ruleRegex.exec(method)) {
                method = parts[1];
                param = parts[2];
            }

            /*
             * If the hook is defined, run it to find any validation errors
             */

            if (typeof this._hooks[method] === 'function') {

                if (!this._hooks[method].apply(this, [field, param])) {
					failed = true;
                }
            } else if (method.substring(0, 9) === 'callback_') {
                // Custom method. Execute the handler if it was registered
                method = method.substring(9, method.length);

                /*if (typeof this.handlers[method] === 'function') {
                    if (this.handlers[method].apply(this, [field.value]) === false) {
                        failed = true;
                    }
                }*/
                if (typeof FormValidateCallBack[method] === 'function') {

                	if(FormValidateCallBack[method](field, field.val()) === false) {
                		failed = true;
                	}
        		}else{
        			Common.alert(method+' function is not defined!');
        		}
            }

            /*
             * If the hook failed, add a message to the errors array
             */

            if (failed) {
                // Make sure we have a message for this rule

                var source = this.messages[method],
                    message = 'An error has occurred with the ' + field.parent().prev("label").text() + ' field.';

                if (source) {

                    message = source.replace('%s', field.parent().prev("label").text().replace('*',''));
                    if (param) {
						param = $('#'+param).parent().prev("label").text().replace('*','');
                        message = message.replace('%s', param);
                    }

                    this._error(field,message);
                }

                this.errors.push({
                    field: field,
                    message: message
                });

                // Break out so as to not spam with validation errors (i.e. required and valid_email)
                break;
            }


        }


    },

    /*
     * @private
     * Object containing all of the validation hooks
     */

    _hooks : {
        required: function(field) {
            var value = field.val();
            if (field.attr("type") === 'checkbox'){
                return (field.attr("checked") === true && value !=='');
            }
            return (value.length >0 && value !== null && value !== '' && value!=undefined);
        },

        matches: function(field, matchName) {
            if (el = $('#'+matchName)) {
                var ok = field.val() == el.val();
                if(ok){
                	el.removeClass('input_error');
                	var nextObj = el.next();
            		if(nextObj.hasClass('field_error')){
            			nextObj.remove();
            		}
                }
                return ok;
            }

            return false;
        },
		matches_different: function(field, matchName) {
			if (el = $('#'+matchName)) {
				var ok = field.val() != el.val();
				if(ok){
					el.removeClass('input_error');
					var nextObj = el.next();
					if(nextObj.hasClass('field_error')){
						nextObj.remove();
					}
				}
				return ok;
			}

			return false;
		},
		unlike: function(field, matchName) {
			if (el = field.closest("form").find('#'+matchName)) {
				var ok = field.val() !== el.val();
				if(ok){
					var rulesField=field.attr("rules");
						rulesField=rulesField.replace("|unlike["+matchName+"]","");
						rulesField=rulesField.replace("unlike["+matchName+"]","");
					field.attr("rules", rulesField);
					el.trigger("change");

					rulesField=rulesField+"|unlike["+matchName+"]";
					field.attr("rules", rulesField);

					//el.removeClass('input_error');
					//var nextObj = el.next();
					//if(nextObj.hasClass('field_error')){
					//	nextObj.remove();
					//}
				}
				return ok;
			}
			return false;
		},
        greater_date_than: function(field, matchName) {
        	var date = field.val();
            date = date.split(' ');
            date[0] = date[0].split('/');

            strdate1 = date[0][2]+date[0][0]+date[0][1]+date[1];

            var date = $('#'+matchName).val();
            date = date.split(' ');
            date[0] = date[0].split('/');

            strdate2 = date[0][2]+date[0][0]+date[0][1]+date[1];
            //alert(strdate1>strdate2);
            var ok = strdate1>strdate2;

            if(ok){
            	el = $('#'+matchName);
            	el.removeClass('input_error');
            	var nextObj = el.next();
        		if(nextObj.hasClass('field_error')){
        			nextObj.remove();
        		}
            }

            return ok;
        },

        less_date_than: function(field, matchName) {
            date = field.val().split(' ');
            date[0] = date[0].split('/');

            strdate1 = date[0][2]+date[0][0]+date[0][1]+date[1];

            date = $('#'+matchName).val().split(' ');
            date[0] = date[0].split('/');

            strdate2 = date[0][2]+date[0][0]+date[0][1]+date[1];
            //alert(strdate1<strdate2);
            var ok = strdate1<strdate2;

            if(ok){
            	el = $('#'+matchName);
            	el.removeClass('input_error');
            	var nextObj = el.next();
        		if(nextObj.hasClass('field_error')){
        			nextObj.remove();
        		}
            }

            return ok;
        },

        valid_name: function(field) {
            var test =  this.javaClassName.test(field.val());
            return test;
        },


        valid_email: function(field) {
            return this.emailRegex.test(field.val());
        },

        valid_emails: function(field) {
            var result = field.val().split(",");

            for (var i = 0; i < result.length; i++) {
                if (!this.emailRegex.test(result[i])) {
                    return false;
                }
            }

            return true;
        },

        min_length: function(field, length) {
            if (!this.numericRegex.test(length)) {
                return false;
            }

            return (field.val().length >= parseInt(length, 10));
        },

        max_length: function(field, length) {
            if (!this.numericRegex.test(length)) {
                return false;
            }

            return (field.val().length <= parseInt(length, 10));
        },

        exact_length: function(field, length) {
            if (!this.numericRegex.test(length)) {
                return false;
            }

            return (field.val().length === parseInt(length, 10));
        },

        greater_than: function(field, param) {
            if (!this.decimalRegex.test(field.val())) {
                return false;
            }
            if(parseFloat(param) == 0){
            	//object
	            var ok = (parseFloat(field.val()) > parseFloat($('#'+param).val()));
	            if(ok){
	            	el.removeClass('input_error');
	            	var nextObj = el.next();
	        		if(nextObj.hasClass('field_error')){
	        			nextObj.remove();
	        		}
	            }
	            return ok;
            }else{
            	return (parseFloat(field.val()) > parseFloat(param));
            }
        },

        less_than: function(field, param) {
            if (!this.decimalRegex.test(field.val())) {
                return false;
            }

            if(parseFloat(param) == 0){
            	//object
	            var ok = (parseFloat(field.val()) < parseFloat($('#'+param).val()));
	            if(ok){
	            	el.removeClass('input_error');
	            	var nextObj = el.next();
	        		if(nextObj.hasClass('field_error')){
	        			nextObj.remove();
	        		}
	            }
	            return ok;
            }else{
            	return (parseFloat(field.val()) < parseFloat(param));
            }
        },

        alpha: function(field) {
            return (this.alphaRegex.test(field.val()));
        },

        alpha_numeric: function(field) {
            return (this.alphaNumericRegex.test(field.val()));
        },

        alpha_dash: function(field) {
            return (this.alphaDashRegex.test(field.val()));
        },

        numeric: function(field) {
            return (this.decimalRegex.test(field.val()));
        },

        integer: function(field) {
            return (this.integerRegex.test(field.val()));
        },

        decimal: function(field) {
            return (this.decimalRegex.test(field.val()));
        },

        is_natural: function(field) {
            return (this.naturalRegex.test(field.val()));
        },

        is_natural_no_zero: function(field) {
            return (this.naturalNoZeroRegex.test(field.val()));
        },

        valid_ip: function(field) {
            return (this.ipRegex.test(field.val()));
        },

        valid_base64: function(field) {
            return (this.base64Regex.test(field.val()));
        },

        url: function(field) {
            return (this.urlRegex.test(field.val()));
        },

        float: function(field) {
            return (this.floatRegex.test(field.val()));
        },

        valid_slot:function(field){
            var val = field.val();
            return (val.length == 5)&&(this.timeSlot.test(val));
        },
		no_space: function(field) {
			return (this.noSpace.test(field.val()));
		},
		password_special: function(field) {
			return (this.passwordSpecial.test(field.val()));
		},

		phone_number: function(field) {
			return (this.phoneRegex .test(field.val()));
		},

		alpha_space:function(field){

			//var words = [], m, r = /[^\u0000-\u007F]+/g;
			//while (m = r.exec(this.alphaSpaceRegex.test(field.val()))) {
			//	words.push(m[0])
			//}
			//return words;
			if((jQuery.trim( field.val() )).length==0)
				return false;

			return ( !this.alphaSpaceRegex.test(field.val()) );

		},

		isnull_or_white_space:function(field){
			return (this.isNullOrWhitespace.test( field.val() ) );
		},
		valid_image:function(field){
			return (this.fileImage.test( field.val() ) );
		},


        autocomplete_required:function(field){
        	 $(field).parent().removeClass('input_error');
        	count = $(field).parent().find('input[type=hidden]').length;

        	if(count) return true;
        	else{
        		this._error($(field).parent());
        		return false;
        	}
        },
		no_comma:function(field){
			return (!this.commaOnly.test(field.val()));
		},
		no_special_character :function(field){
			var str=field.val();
			if(str.replace(/[\s,\,]/gi, "")=='') return false;
			return (!this.someSpecialCharacters.test(field.val()));
		},
		no_special_ex_slash :function(field){
			var str=field.val();
			if(str.replace(/[\s,\,]/gi, "")=='') return false;
			return (!this.someSpecialCharacters_except_slash.test(field.val()));
		},
		min_unit: function(field, length) {
			if (!this.numericRegex.test(length)) {
				return false;
			}
			var arrStr=field.val().split(",");
			var count_str=0;

			arrStr= $.unique(arrStr);

			var str_length=arrStr.length;
			for (var i=0; i<str_length; i++){
				if(arrStr[i].trim() !=="" && arrStr[i]!== undefined){
					count_str++;
				}
			}
			return (count_str >= parseInt(length, 10));
		},
		unlike_group: function(field, matchName) {
			var arr_match_name=matchName.split(",");
			var ok=true;
			var field_val='';

			field.closest(".paramWrap").find(".controls input[type='text']").each(function(){
				field_val += solrController.b64EncodeUnicode($(this).val());
			});
			//console.log("FIELD: "+field_val+"_____");
			arr_match_name.forEach(function(val){
				var el_val='';
				if (el = $('#'+val)) {
					el.closest(".paramWrap").find(".controls input[type='text'].validate").each(function(){
						el_val +=solrController.b64EncodeUnicode($(this).val());
					});
					//console.log("EL: "+el_val+"_END");
					var diff = (field_val !== el_val);
                    if(!diff){
                        if(!el.closest(".filterItemWrap").find('.icon-plus').hasClass("icon-minus")){
                            el.closest(".filterItemWrap").find('.icon-edit').trigger("click");
                        }
                    }else {
                        if(el.closest(".filterItemWrap").find('.icon-plus').hasClass("icon-minus")){
                            el.closest(".filterItemWrap").find('.icon-edit').trigger("click");
                        }
                    }
                    //el.trigger("change");
					ok= (ok && diff);
				}
			});
			if(ok){
				field.removeClass('input_error');
				var nextObj = field.next();
				if(nextObj.hasClass('field_error')){
					nextObj.remove();
				}
			}
			field.removeClass('validate');
			field.closest(".paramWrap").find(".controls input[type ='text'].validate").trigger("change");
			field.addClass('validate');
			return ok;
		},
		txt_file:function(field){
			return (this.txtFile.test( field.val() ) );
		},
		required_trim: function(field) {
			var value = field.val().trim();
			if (field.attr("type") === 'checkbox'){
				return (field.attr("checked") === true && value !=='');
			}
			return (value.length >0 && value !== null && value !== '' && value!=undefined);
		},
    }

};