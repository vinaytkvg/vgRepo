<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Offer_can_not_be_extended</fullName>
        <description>Offer can not be extended</description>
        <protected>false</protected>
        <recipients>
            <recipient>lalaiah.254@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NEW</template>
    </alerts>
    <alerts>
        <fullName>offer_letter_request</fullName>
        <description>offer letter request</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Dom_App</template>
    </alerts>
    <fieldUpdates>
        <fullName>APPROVED_OFFER</fullName>
        <field>Offer_Extended__c</field>
        <literalValue>1</literalValue>
        <name>APPROVED OFFER</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
