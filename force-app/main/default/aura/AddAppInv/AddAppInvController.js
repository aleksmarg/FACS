({
	doInit: function(cmp, event, helper) {
	
      cmp.set('v.columns', [
            {label: 'App name', fieldName: 'Name', type: 'text'}
             ]);
      helper.fetchRelatedList(cmp);
      
   },
    addAppInv : function(cmp, event, helper) {
		var action = cmp.get("c.linkAppInv");
        action.setParams({
            "appId": cmp.get('v.selectedLookUpRecord').Id,
            "projId": cmp.get("v.recordId")           
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type": 'success',
                    "message": "The relation has been updated successfully."
                });
                toastEvent.fire();
                location.reload();
                var childCmp = cmp.find("cComp")
 				childCmp.clearSelection();
                $A.get('e.force:refreshView').fire();
            }
        });
        $A.enqueueAction(action);
	},
    handleGroupChangerel: function (cmp, event) {
        var value = event.getParam('selectedRows');
        cmp.set('v.selection', value);
        if(JSON.stringify(cmp.get('v.selection'))!='[]'){
            cmp.set('v.showRemove', false);
        }else{
            cmp.set('v.showRemove', true);
        }
        
    },
    RemoveRowSelection:function (cmp) {
        var action = cmp.get("c.removeParent");
        action.setParams({
            "recordList": JSON.parse(JSON.stringify(cmp.get('v.selection')))
           
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS") {
               var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "type": 'success',
                    "message": "The relation has been removed successfully."
                });
                toastEvent.fire();
                cmp.set('v.selection', '');
                cmp.set('v.selectedRows', '');
                location.reload();

                $A.get('e.force:refreshView').fire();
                helper.fetchRelatedList(cmp);
            }
        });
        $A.enqueueAction(action);
    }
})