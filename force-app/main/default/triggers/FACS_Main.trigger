/**
 * @File Name          :  FACS_Main trigger
 * @Description        :
 * @Author             : A.Margovskiy
 * @Group              :
 * @Last Modified By   : 
 * @Last Modified On   :  
 * @Modification Log   :
 * Ver       Date            Author              Modification
 * 1.0    03/08/2023   A.Margovskiy     Initial Version
 **/


trigger FACS_Main on FACS_MAIN__c (after update,before update) {

String emailOUT='';

    if(trigger.IsBefore){
for(FACS_MAIN__c Main: Trigger.new){
 //System.debug('id is: ' + Main.Id);
 

if     ( Main.FACS_Email_type__c.equalsIgnoreCase('FBC Log') && Main.FACS_STATUS__c.equalsIgnoreCase('Sent')) {
        
      // delete all files
              
         List<ContentDocumentLink> casAttmtList = [SELECT Id,LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId = :Main.id ];       
   delete casAttmtList;
       
        ContentVersion conVer = new ContentVersion();
conVer.ContentLocation = 'S'; 
conVer.PathOnClient = 'FBC_' + Datetime.now().format(' MMddyy_HHmma')+'.txt';
conVer.Title = 'FBC_' + Datetime.now().format(' MMddyy_HHmma')+'.txt';
conVer.VersionData = Blob.valueof(Main.FACS_Schedule_Long__c); 
insert conVer;    //Insert ContentVersion

// First get the Content Document Id from ContentVersion Object
Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
//create ContentDocumentLink  record 
ContentDocumentLink conDocLink = New ContentDocumentLink();
conDocLink.LinkedEntityId = Main.id; 
conDocLink.ContentDocumentId = conDoc;  
conDocLink.shareType = 'V';
insert conDocLink;
         
 } // end FBC log txt file 

  // emails from DLs
       
 list<String> tmpString = new List<String>();
           FACS_Main__c a = [Select tolabel(FACS_DistLists__c),FACS_ORG_Emails__c,FACS_STATUS__c from FACS_Main__c where id= :Main.Id ]; 
           
           string lists;
           lists=a.FACS_DistLists__c;
  //Only when status =Sent
IF(a.FACS_STATUS__c.equalsIgnoreCase('Sent')){

 // check if not empty

IF(a.FACS_DistLists__c!=null ){

tmpString.addAll(a.FACS_DistLists__c.split(';'));
integer size =tmpString.size();

if (size!=0){
//DL loop to build in clause

String DL='';
for(Integer i=0; i<size;++i){
    dl='\''+tmpString[i]+'\'' +','+DL ; // add ' to DL list "in" string
}

DL=DL.removeEND(','); // rempve last  comma,
DL='('+DL+')'; //add ()
// Email loop
 String q='select FACS_Email__c from FACS_DL_List_Email__c where FACS_DL_List__r.name  in ' + DL;
 
 // check if not empty

list<FACS_DL_List_Email__c> accts = Database.query(q);
 
 ////String emailOUT='';
Integer Iemailsize=accts.size();

for(Integer i=0; i<Iemailsize;++i){
emailOUT=emailOUT+accts[i] .FACS_Email__c +';' ;

}
 emailOUT=emailOUT.removeEND(';');// check if not empty!
    
    /// check Orig emails if any add to email list
    if(a.FACS_ORG_Emails__c!=''){
        emailOUT=emailOUT+';'+a.FACS_ORG_Emails__c;
    }
    
//update emails g
 Main.FACS_ORG_Emails__c=emailOUT;

}
}  // DL is not null end

 } //Sent
 
  } // trigger New

} //IsBefore

} //end