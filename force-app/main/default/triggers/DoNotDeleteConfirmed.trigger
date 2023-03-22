/**
 * @File Name          :  DoNotDeleteConfirmed trigger
 * @Description        :
 * @Author             : A.Margovskiy
 * @Group              :
 * @Last Modified By   : 
 * @Last Modified On   :  
 * @Modification Log   :
 * Ver       Date            Author              Modification
 * 1.0    03/08/2023   A.Margovskiy     Initial Version
 **/
trigger DoNotDeleteConfirmed on FACS_MAIN__c (before delete) {

for(FACS_Main__c acc : trigger.old){
        if( acc.FACS_Status__c.contains('Confirmed')){
            acc.adderror('Sorry, we cannot delete confirmed records.');
        }
 }

}