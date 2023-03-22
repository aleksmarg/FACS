({
    //helper method to call apex methods
    callServerSideMethod : function(component, event, helper, methodName) {
        //show spinner
        $A.util.removeClass(component.find("spinnerId"),'slds-hide');
        var action = component.get("c."+methodName);
        
        if (methodName === "getPreemptionDetails" ) {
            action.setParams({
                recordId : component.get("v.recordId")
            });
        }    
        else if (methodName === "submitUpdatedTimings") {
            action.setParams({
                preemption : component.get("v.preemptionObj")
            });
        }    
        
        action.setCallback(this, function(resp){
            //hide spinner
            $A.util.addClass(component.find("spinnerId"),'slds-hide');
            //process response
            var state = resp.getState();
            var result = resp.getReturnValue();
            
            if (state === "SUCCESS") {
                if (methodName === "getPreemptionDetails") {
                    if (result.exceptionFlag) {
                        //error toast incase of exceptions
                        var generalErrorMessage = result.exceptionMessage
                        this.closeQuickAction(component, event, helper);                        
                        this.showToast(component, event, helper, "error" ,"Error!", generalErrorMessage);
                    }
                    else {
                        
                        component.set("v.preemptionObj", result.preemptionDetail);
                        
                        //populating from pick list values
                        var fromPicklistValues = result.fromValues;
                        var fromValues = [];
                        for (var key in fromPicklistValues) {
                            fromValues.push(fromPicklistValues[key]);
                        }
                        component.set("v.fromTimeValues", fromValues);
                        
                        //populating to picklist values
                        var toPicklistValues = result.toValues;
                        var toValues = []
                        for (var key in toPicklistValues) {
                            toValues.push(toPicklistValues[key]);
                        }
                        component.set("v.toTimeValues", toValues);
                    }
                }
                else if (methodName === "submitUpdatedTimings") {
                    if (result.exceptionFlag) {
                        //error toast incase of exceptions
                        var generalErrorMessage = result.exceptionMessage
                        this.closeQuickAction(component, event, helper);                        
                        this.showToast(component, event, helper, "error" ,"Error!", generalErrorMessage);
                    }
                    else {
                        //success toast
                        var successMessage = $A.get("$Label.c.ATS_ProgramTimeUpdateSuccessMessage");
                        this.closeQuickAction(component, event, helper);                        
                        this.showToast(component, event, helper, "success" ,"Success!", successMessage);
                        $A.get("e.force:refreshView").fire();
                    }    
                }
            } else if (state === "ERROR") {
                //error toast incase of exception message
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