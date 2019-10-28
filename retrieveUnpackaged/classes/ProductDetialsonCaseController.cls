public class ProductDetialsonCaseController {
	@AuraEnabled
    public static wrarData fetchrateCard(String CaseId) {
        //List<Rate_Card__c> rateCard = [SELECT Id, Rate_Category__c, UK__c, FR__c, ES__c, IT__c,DE__c from Rate_Card__c where Rate_Category__c = 'Cost per Calendar Month'];
        wrarData wrapRec = new wrarData();
        for(Rate_Card__c rc : [SELECT Id, Rate_Category__c, UK__c, FR__c, ES__c, IT__c,DE__c from Rate_Card__c limit 50000]){
            if(rc.Rate_Category__c != null && rc.Rate_Category__c != '' && rc.Rate_Category__c == 'Cost per Calendar Month')
            	wrapRec.ccmRateCard.add(rc);
            else if(rc.Rate_Category__c != null && rc.Rate_Category__c != '' && rc.Rate_Category__c == 'ATM Fee in other currencies')
            	wrapRec.atmRateCard.add(rc);
            else if(rc.Rate_Category__c != null && rc.Rate_Category__c != '' && rc.Rate_Category__c == 'Card Replacement Cost')
            	wrapRec.crcRateCard.add(rc);
        }
        return wrapRec;
    }
    
    public class wrarData{
        @AuraEnabled public List<Rate_Card__c> ccmRateCard;
        @AuraEnabled public List<Rate_Card__c> atmRateCard;
        @AuraEnabled public List<Rate_Card__c> crcRateCard;
        public wrarData(){
            ccmRateCard = new List<Rate_Card__c>();
            atmRateCard = new List<Rate_Card__c>();
            crcRateCard = new List<Rate_Card__c>();
        }
    }
}