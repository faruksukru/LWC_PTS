trigger AccountTrigger on Account (before update) {
    Trigger_Config__mdt triggerConfig = Trigger_Config__mdt.getInstance('AccountTrigger');
    if(triggerConfig.active__c=='Yes'){
        for(Account w: Trigger.new){
            w.phone='555';
        }
    }
}