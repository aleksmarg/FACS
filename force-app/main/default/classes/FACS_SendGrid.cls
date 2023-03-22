/**
 * @description       : FACS_SendGrid class for FACS_SendEmail flow 
 * @author            : A.Margovskiy
 * @group             :
 * @last modified on  : 03/08/2023
 * @last modified by  : A.Margovskiy
 **/

public class FACS_SendGrid {

 @InvocableMethod(label='FACS Send Grid')
 public static List<String> getID(List<String> ids){

List<FACS_Main__c> mains = [Select ID from FACS_Main__c where ID in :ids];

 List<String> recID = new List<String>();
 for(FACS_Main__c mn:mains){

 recID.add(mn.id);
 
 }
 
 //system.debug(recid.get(0)) ;  
  SendEmails(recid.get(0));
 return recID;
 
 }
 
public static void  SendEmails(id recordid){

String str=''; // Email ; separated list
String varDocID; // doc ID
String mailfromlname='FOX Affiliate Communication System'; // from name
String emailFROM='FACSdonotreply@fox.com'; //from  email
String fileapp ; // application/pdf txt/html word
String sError; // if not 0 error in trigger to return
integer iBatchSuccess=0; //success batch submission count
integer iBatchError=0; //Error batch submission count
String sFailedEmails; //Email list from failed batches for resend

// FACS main

FACS_Main__c Main=[select FACS_STATUS__c, FACS_SUBJECT__c ,FACS_EmailBody__c,FACS_ORG_Emails__c,FACS_FailedEmails__c, FACS_SendGrid_confirmation__c from FACS_Main__c where ID=:recordid];

// only if sent
if(Main.FACS_STATUS__c=='Sent' && Main.FACS_ORG_Emails__c!=''){

//ID from ContentDocumentLink 
ContentDocumentLink contlink=[select ContentDocumentId from ContentDocumentLink where LinkedEntityId =: recordid];

// get doc data from ContentVersion blob=Versiondata , file name=PathOnClient 

ContentVersion cntvers=[select id,FileType, Title,FileExtension, Versiondata, PathOnClient from ContentVersion where islatest=true and ContentDocumentId=:contlink.ContentDocumentId ];
 
 //application/file type selector WORD, EXCEL, TEXT, EXCEL_X, WORD_X, PDF
   if(cntvers.FileType=='PDF') {fileapp ='application/pdf'; } 
 
   if(cntvers.FileType=='WORD') { fileapp ='application/msword'; }
  
   if(cntvers.FileType=='WORD_X') {fileapp ='application/msword';}
   
  if(cntvers.FileType=='EXCEL') {fileapp ='application/vnd.ms-excel';}
  
   if(cntvers.FileType=='EXCEL_X') { fileapp ='application/vnd.ms-excel';}
   
  if(cntvers.FileType=='TEXT') {fileapp ='text/plain'; }
 
 // error when file is fifferent type from above
 
 if(fileapp==null){
 iBatchError=100000;
 sError='Failed for delivery.File is wrong type.Only PDF, Word, Excel and Text file allowed.';
 // Main.addError(sError);
 } 
 else {    // send grid part
 
List <String > strList = Main.FACS_ORG_Emails__c.split( ';' );
Integer iEsize=strList.size();
String sEout='';
Integer iBatchLimit=900;//SendGrid TO email list limit up to 1000
integer iBatch=0; // counter until iBatchLimit
integer iBatchlim=0;   //counter for loop with full iBatchLimit

If (iEsize!=0){
    //Email string loop
for (Integer i=0; i<10;++i){
    
   System.debug( 'List String is '+ strList[i] );
   
      
    CORE_SendGridRequest sendGridRequest = new CORE_SendGridRequest(false); //add 1 personalization
sendGridRequest.setFrom('FOX Affiliate Communication System', 'FACS@fox.com');
sendGridRequest.setReplyTo('DO NOT REPLY', 'DONOTREPLY@fox.com'); //use this if different from From setting
sendGridRequest.subject= Main.FACS_SUBJECT__c;
sendGridRequest.addTrackSetting(true, true);
////Blob samplePDF = Blob.valueOf(cntvers.Versiondata);
Blob samplePDF = cntvers.Versiondata;
sendGridRequest.addAttachment('attachment', cntvers.PathOnClient , fileapp, EncodingUtil.base64Encode(samplePDF));
sendGridRequest.addContent('text/html', '<div>'+ Main.FACS_EmailBody__c + '</div>');
    
    if(iBatch+iBatchLimit >=iEsize)
    {
     
    for(Integer y=iBatch; y<iEsize; ++y){
    
    system.debug(iBatch+'>>>>>>>'+iEsize);
 

        CORE_SendGridRequest.personalization newPersonalization = new CORE_SendGridRequest.personalization();
newPersonalization.addTo(null, strList[y]);
sendGridRequest.personalizations.add(newPersonalization);

// emails for resend in case of error

sFailedEmails=sFailedEmails+strList[y]+';' ;

++Ibatch;

// breake here 
if (Ibatch >=iEsize){ 
break;
}
 

} // end last for



}
else if (iBatch+iBatchLimit <iEsize){
 for(Integer y=iBatch; y<iBatch+iBatchLimit; ++y){
 

        CORE_SendGridRequest.personalization newPersonalization = new CORE_SendGridRequest.personalization();
newPersonalization.addTo('', strList[y]);
sendGridRequest.personalizations.add(newPersonalization);

// emails for resend in case of error

sFailedEmails=sFailedEmails+strList[y]+';' ;

++Ibatch;
++iBatchlim;
        if (iBatchlim >=iBatchLimit){ 
        iBatchlim=0;
            break;
                    }



}

}

////sendGridRequest

CORE_CalloutResponse response = CORE_EmailService.sendEmail(sendGridRequest, null);

if (response.errors == null || response.errors.isEmpty()) {  
                
                ++iBatchSuccess;
                }   
                else {
                ++iBatchError;
             if(  sError==null) {
             sError=sFailedEmails;
             
             } else
             {    sError=sError+';' +sFailedEmails;  }
               
                sFailedEmails='';
                }           
//   System.debug('$$ ' + response);

// breake here 
if (Ibatch >=iEsize){ 
break;

}
           
}


}
} 
//return sError and update Main

if(iBatchError==0){
Main.FACS_Status__c='Confirmed';
Main.FACS_SendGrid_confirmation__c='Delivered to SendGid';
update Main;

}
else {
if (iBatchError!=100000){
//Main.FACS_Status__c='Error';
Main.FACS_SendGrid_confirmation__c=iBatchError +' batched failed, '+iBatchSuccess +' batches have been accepted for email delivery';
Main.FACS_FailedEmails__c=sError;
//update Main;
}
else {
Main.FACS_Status__c='Error';
Main.FACS_SendGrid_confirmation__c=sError;
}
update Main;

}



}//status Sent
 
 
 
 }
 
 } // class