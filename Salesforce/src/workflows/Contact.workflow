<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AccountUpdateAfterDelete</fullName>
        <field>FirstName</field>
        <formula>Account.Name + &apos;delete&apos;</formula>
        <name>AccountUpdateAfterDelete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>UPDATE PHONE</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Phone</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
