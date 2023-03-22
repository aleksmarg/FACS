trigger FACS_MAinbefore on FACS_MAIN__c (before update) {

for (FACS_MAIN__c BU : Trigger.New)
{
system.debug (bu.id);
List<Attachment> casAttmtList = [SELECT Id,ParentId FROM Attachment WHERE ParentId = :bu.id ];       
 delete casAttmtList;

}

}