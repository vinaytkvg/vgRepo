<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CHANGE_EMP_LAYOUT</fullName>
        <field>RecordTypeId</field>
        <lookupValue>EmpRECORDTYPE</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>CHANGE EMP LAYOUT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CHANGE EMPLOYEE LAYOUT</fullName>
        <actions>
            <name>CHANGE_EMP_LAYOUT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.DEP_PL__c</field>
            <operation>equals</operation>
            <value>HR</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rule timt</fullName>
        <actions>
            <name>time</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Employee__c.Name</field>
            <operation>equals</operation>
            <value>vinay</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Employee__c.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>time</fullName>
        <assignedTo>vinay@ganesh.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Employee__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>time</subject>
    </tasks>
</Workflow>
