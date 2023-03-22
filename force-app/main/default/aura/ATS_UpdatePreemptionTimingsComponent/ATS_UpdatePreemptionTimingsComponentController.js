({
    //function which gets called on component initialization
	doInit : function(component, event, helper) {
		helper.callServerSideMethod(component, event, helper,'getPreemptionDetails');
	},
    
    //function to close quick action
    cancel : function(component, event, helper) {
        helper.closeQuickAction(component, event, helper);
    },
    
    //function to save from and to dates
    submit : function(component, event, helper) {
        helper.callServerSideMethod(component, event, helper, 'submitUpdatedTimings');
    }
})