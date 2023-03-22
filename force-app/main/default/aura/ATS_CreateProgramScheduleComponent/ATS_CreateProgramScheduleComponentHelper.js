({
    //helper function to call apex methods
    callServerSideMethod : function(component, event, helper, methodName){
        //showing spinner
        $A.util.removeClass(component.find("spinnerId"),'slds-hide');
        var action = component.get("c."+methodName);
        
        //setting params
        action.setParams({
            "recordId" :  component.get("v.recordId")
        });
        
        action.setCallback(this, function(resp){
            //hiding spinner
            $A.util.addClass(component.find("spinnerId"),'slds-hide');
            
            //processing response
            var state = resp.getState();
            var result = resp.getReturnValue();
            
            if (state === "SUCCESS") {
                if (methodName === "ATS_CreateProgramSchedules") {
                    if (result) {
                        //success toast
                        var successMessage = $A.get("$Label.c.ATS_CreateSchedulesSuccessMessage");
                        this.closeQuickAction(component, event, helper);                        
                        this.showToast(component, event, helper, "success" ,"Success!", successMessage);
                    } else {
                        //failure toast
                        var generalErrorMessage = $A.get("$Label.c.ATS_GenericExceptionMessage");
                        this.closeQuickAction(component, event, helper);                        
                        this.showToast(component, event, helper, "error" ,"Error!", generalErrorMessage);
                    }
                }
                
            } else if (state === "ERROR") {
                //failure toast incase of error
                var generalErrorMessage = $A.get("$Label.c.ATS_GenericExceptionMessage");
                this.closeQuickAction(component, event, helper);                        
                this.showToast(component, event, helper, "error" ,"Error!", generalErrorMessage);
            }
            
        });
        
        $A.enqueueAction(action);
    },
    
	//to close quick actions
    closeQuickAction : function(component, event, helper){
        var closeAction = $A.get("e.force:closeQuickAction");
        closeAction.fire();
    },
    
    //generic function used to display toast messages
    showToast : function(component, event, helper, type, title, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "type": type,
            "title": title,
            "message": message
        });
        toastEvent.fire();
	},
})