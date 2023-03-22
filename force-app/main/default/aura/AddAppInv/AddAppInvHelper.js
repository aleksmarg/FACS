({
	fetchRelatedList:function(cmp){
        var action = cmp.get("c.showRelated");
      action.setParams({
         "parentId":cmp.get("v.recordId")
        }); 
      action.setCallback(this, function(response) {
          var state = response.getState();
          
         if(state === "SUCCESS") {
             
             var result = response.getReturnValue();
             console.log('result ---->' + JSON.stringify(result));
             cmp.set('v.data', result);
         	cmp.set('v.rowKeys', this.getKeysFromData(result));
         }  
         });
      $A.enqueueAction(action);
    },
    getKeysFromData: function (data) {
        return data.map(function (row, index) {
            return {
                value: row.id,
                label: '#' +  (parseInt(index) + 1) + ' - ' + row.id,
            };
        });
    }
})