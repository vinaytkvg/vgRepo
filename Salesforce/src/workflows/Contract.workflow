<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Sent_to_after_insert_account</fullName>
        <ccEmails>vinay.oy254@gmail.com</ccEmails>
        <ccEmails>vinay.kumar@cyberoam.com</ccEmails>
        <description>Email Sent to after insert account</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Candidate_Info</template>
    </alerts>
    <rules>
        <fullName>Contract1Rule</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contract.Status</field>
            <operation>equals</operation>
            <value>Activated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Becareful</fullName>
        <assignedTo>ganesh@vinay254.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>true</protected>
        <status>In Progress</status>
        <subject>Becareful</subject>
    </tasks>
</Workflow>
