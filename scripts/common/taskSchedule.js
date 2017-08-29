// JavaScript Document
/**
 * Do task by Schedule
 * @author Lucdt@ideavietnam.com
 */
objFun = function(funName,time,status){
		this.fun = funName;
		this.time = time;
		this.status = status;
	};
	
objFun.prototype = {
	fun: null,
	time:null,
	status: 0,
	timeoutId : null
	};
	
var taskSchedule = {
	/**
	 * Store all function running
	 */
	funArray: new Array(),
	
	/**
	 * Add function to Stack
	 * @param funName
	 * @param time
	 * @param status : 1-running , 0-off
	 */
	add: function(funName,time,status){
		var obj = new objFun(funName,time,status);
		this.funArray.push(obj);
	},
	
	/**
	 * run a function
	 */
	run : function(funName){
		for(i=0;i<this.funArray.length	;i++){
			if(this.funArray[i].fun == funName && this.funArray[i].status == 0){
				this.funArray[i].status = 1
				this.timeoutId = setInterval( this.funArray[i].fun, this.funArray[i].time);	
			};	
		}
	},
	
	/**
	 * Run all function in the Stack
	 */
	runAll : function(){
		//alert(this.funArray.length);
		for(i=0;i<this.funArray.length	;i++){
			if(this.funArray[i].status == 0){
				this.funArray[i].status = 1;
				//alert(this.funArray[i].fun);
				this.timeoutId = setInterval( this.funArray[i].fun, this.funArray[i].time);	
			};	
		}
	},
	
	/**
	 * Stop a function
	 */
	stop : function(funName){
		for(i=0;i<this.funArray.length	;i++){
			if(this.funArray[i].fun == funName){
				if(this.funArray[i].status == 1) clearInterval  ( this.timeoutId );
				this.funArray[i].status = 0; return;
			};	
		}	
	},
	
	/**
	 * Stop All function in the Stack
	 */
	stopAll : function(){
		for(i=0;i<this.funArray.length	;i++){
			if(this.funArray[i].status == 1){
				this.funArray[i].status = 0
				clearInterval  ( this.timeoutId );
			};	
		}
	},
	
	/**
	 * Remove function out of Stack
	 */
	remove : function(funName){
		for(i=0;i<this.funArray.length	;i++){
			if(this.funArray[i].fun == funName){
				if(this.funArray[i].status == 1) clearInterval  ( this.timeoutId );
				delete(this.funArray[i]); return;
			};	
		}	
	},
	
	/**
	 * Clear Stack
	 */
	removeAll : function(){
		for(i=0;i<this.funArray.length	;i++){			
			if(this.funArray[i].status == 1) clearInterval  ( this.timeoutId );		
		}
		this.funArray = new Array(); 	
	}
	
}




