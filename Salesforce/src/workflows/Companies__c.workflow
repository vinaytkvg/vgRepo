<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>field_update</fullName>
        <field>PRICE__c</field>
        <formula>4000</formula>
        <name>field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <tasks>
        <fullName>FIELD_COMP</fullName>
        <assignedTo>vinay@ganesh.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Companies__c.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>FIELD COMP</subject>
    </tasks>
</Workflow>
