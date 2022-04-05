public without sharing class ACN_QuestionniareContainerCtrl {
    
    public without sharing class questionWrapper{
        @AuraEnabled
        public ACN_Screen_Data_Elements__c eachQuesDetails{get;set;}
        @AuraEnabled
        public string allResponseDetails{get;set;}
        @AuraEnabled
        public string callFlowTemplateId{get;set;}
        @AuraEnabled
        public Boolean isDefaultQuestion{get;set;}
        
        
        public questionWrapper(ACN_Screen_Data_Elements__c eachQuesDetails, String allResponseDetails, 
                               String callFlowTemplateId, Boolean isDefaultQuestion) {
                                   this.eachQuesDetails = eachQuesDetails;
                                   this.allResponseDetails = allResponseDetails;
                                   this.callFlowTemplateId = callFlowTemplateId;
                                   this.isDefaultQuestion = isDefaultQuestion;
                               }
    }
    
    @AuraEnabled
    public static List<questionWrapper> getQuestionDetails(String templateId){
        
        // templateId = 'a1y2a000000cD4KAAU';
        
        List<questionWrapper> quesWrapper = new List<questionWrapper>();
        try{
            /* list<ACN_Screen_Data_Elements__c> quesDetails = [Select Id, Name, ACN_Question_Identifier__c, ACN_Display_Order__c, ACN_Question_Logic__c, ACN_Default_Question__c, ACN_Screen__r.ACN_Screen_Logic__c,
ACN_Screen__r.ACN_Screen_Number__c, ACN_Input_Questions__c,
ACN_Screen__r.ACN_Default_Action_Screen__c, ACN_Screen__r.ACN_isStartScreen__c, ACN_Screen__r.ACN_isEndScreen__c, 
ACN_Screen__r.ACN_Default_Questions__c, ACN_Screen__r.ACN_Call_Flow_Template__r.Name,
ACN_Question__r.Name,ACN_Question__r.ACN_Type__c, ACN_Question__r.ACN_Options__c, ACN_Screen__r.ACN_hasBranching__c,
ACN_Screen__r.ACN_Stage_Sequence_No__c, ACN_Screen__r.ACN_Stage_Name__c,ACN_Question__r.ACN_Compound_Screen__c,
ACN_Question__r.ACN_Questions_Input__c
from ACN_Screen_Data_Elements__c
where ACN_Screen__r.ACN_Call_Flow_Template__c =: templateId
Order By ACN_Display_Order__c, ACN_Screen__r.ACN_Stage_Sequence_No__c ASC Limit 50000];
*/
            
            for(ACN_Screen_Data_Elements__c eachData : [Select Id, Name, ACN_Question_Identifier__c, ACN_Display_Order__c, 
                                                        ACN_Question_Logic__c, ACN_Default_Question__c, 
                                                        ACN_Screen__r.ACN_Screen_Logic__c,ACN_Screen__r.ACN_Screen_Number__c,                                                         
                                                        ACN_Input_Questions__c,ACN_Screen__r.ACN_Default_Action_Screen__c, 
                                                        ACN_Screen__r.ACN_isStartScreen__c, ACN_Screen__r.ACN_isEndScreen__c, 
                                                        ACN_Screen__r.ACN_Default_Questions__c, ACN_Screen__r.ACN_Call_Flow_Template__r.Name,
                                                        ACN_Question__r.Name,ACN_Question__r.ACN_Type__c, ACN_Question__r.ACN_Options__c, 
                                                        ACN_Screen__r.ACN_hasBranching__c,ACN_Screen__r.ACN_Stage_Sequence_No__c, 
                                                        ACN_Screen__r.ACN_Stage_Name__c,ACN_Question__r.ACN_Compound_Screen__c                                                        
                                                        FROM ACN_Screen_Data_Elements__c
                                                        WHERE ACN_Screen__r.ACN_Call_Flow_Template__c =: templateId
                                                        Order By ACN_Display_Order__c, ACN_Screen__r.ACN_Stage_Sequence_No__c 
                                                        ASC])
            {
                
                quesWrapper.add(new questionWrapper(eachData, '', templateId, eachData.ACN_Default_Question__c));
            }
            return quesWrapper;
        }
        catch(Exception e){
            return null;
        }
        
    }
    
    @AuraEnabled
    public static Map<Integer, String> getProgressPathDetails(String templateId) {
        
        // templateId = 'a1y2a000000cD4KAAU';
        Map<Integer, String> mapProgressPath = new Map<Integer, String>();
        try{
            /* list<ACN_Screen_Data_Elements__c> listAllQues = new list<ACN_Screen_Data_Elements__c>([Select ACN_Screen__r.ACN_Stage_Sequence_No__c, ACN_Screen__r.ACN_Stage_Name__c
                                                                                                   from ACN_Screen_Data_Elements__c 
                                                                                                   where ACN_Screen__r.ACN_Call_Flow_Template__c =: templateId Limit 50000]);
            */
            for(ACN_Screen_Data_Elements__c each : [SELECT ACN_Screen__r.ACN_Stage_Sequence_No__c, ACN_Screen__r.ACN_Stage_Name__c
                                                    FROM ACN_Screen_Data_Elements__c 
                                                    WHERE ACN_Screen__r.ACN_Call_Flow_Template__c =: templateId]) {
                                                        mapProgressPath.put((Integer)each.ACN_Screen__r.ACN_Stage_Sequence_No__c, each.ACN_Screen__r.ACN_Stage_Name__c);
                                                    }
        }
        catch(Exception e)
        {            
        }
        //System.debug('MAP PROGRESS PATH:::: '+mapProgressPath);
        return mapProgressPath;
    }
    
}