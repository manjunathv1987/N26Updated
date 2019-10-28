global class N26_SurveyEmail implements Database.Batchable<sObject> {
    public string query = 'select Id, Name, Email, Survey_Date__c,OwnerId from Contact where Survey_Date__c = system.today()';
    
    global database.querylocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, Sobject[] scope)
    {   
        list<Messaging.SingleEmailMessage> emailList = new list<Messaging.SingleEmailMessage>();
        list<Contact> conLst = new list<Contact>();
        EmailTemplate emailTemplate = [select Id, Body  from EmailTemplate where DeveloperName = 'N26_Survey_Email'];
        
        for (Contact item : (List<Contact>)scope) {
            
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {item.Email});
            email.setSaveAsActivity(false);
            email.setTargetObjectId(item.OwnerId);
            email.setTemplateId(emailTemplate.Id);
            email.setWhatId(item.Id);
            emailList.add(email);
            
            conLst.add(new Contact(Id= item.Id, Survey_Date__c = null));
        }
        if(!emailList.isEmpty())
            Messaging.sendEmail(emailList);
        if(!conLst.isEmpty() ) {
            Database.update(conLst, false);
        }       
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
}