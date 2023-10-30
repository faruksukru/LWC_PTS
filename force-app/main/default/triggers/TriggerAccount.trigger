trigger TriggerAccount on Account (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert){
        for(Account eachAccount:Trigger.new){
            if(string.isBlank(eachAccount.Fax)){
            eachAccount.Fax ='123456';
        }
        }
    }

}