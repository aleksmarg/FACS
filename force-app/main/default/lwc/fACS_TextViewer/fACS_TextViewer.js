import { LightningElement ,api,track,wire} from 'lwc';
import { getRecord, updateRecord, getFieldValue } from "lightning/uiRecordApi";
///import { ShowToastEvent } from "lightning/platformShowToastEvent";
import FACS_SCHEDULE_FIELD from '@salesforce/schema/FACS_MAIN__c.FACS_Schedule_Long__c';
import FACS_ID_FIELD from '@salesforce/schema/FACS_MAIN__c.Id';
const fields = [FACS_ID_FIELD,FACS_SCHEDULE_FIELD ];

export default class FACS_TextViewer extends LightningElement  {
   @api value;
    
   @api recordId;
   @api RecordOutId;
    @api enableEdit = false;
    @track textValue;
    
     @wire(getRecord, { recordId: '$recordId', fields}) FACS_MAIN;

    connectedCallback() {
        this.textValue = this.value;
        // console.log("recordId", this.recordId);
    }

   
    handleclick(){
        //    this.template.querySelector('input').click();

        
         /// working code 
         // alert (this.template.querySelector("textarea").value);


         

 ///alert("test  recordid    " + this.recordId +this.template.querySelector("textarea").value);  //  return indefined
           
const fields = {};
fields[FACS_ID_FIELD.fieldApiName] = this.recordId;
fields[FACS_SCHEDULE_FIELD.fieldApiName] = this.template.querySelector("textarea").value;

const recordInput = { fields };

updateRecord(recordInput);


alert("Schedule has been updated");
    }
}