<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CONVEY_INFO_THROUGH_EMAIL</fullName>
        <ccEmails>vinay.oy254@gmail.com</ccEmails>
        <description>CONVEY INFO THROUGH EMAIL</description>
        <protected>true</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Dom_App</template>
    </alerts>
    <alerts>
        <fullName>Email_Sent_to_after_insert_account</fullName>
        <ccEmails>vinay.kumar@cyberoam.com</ccEmails>
        <ccEmails>vinay.oy254@gmail.com</ccEmails>
        <description>Email Sent to after insert account</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NEW</template>
    </alerts>
    <alerts>
        <fullName>Email_Sent_to_after_insert_account1</fullName>
        <description>Email Sent to after insert account1</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Candidate_Info</template>
    </alerts>
    <fieldUpdates>
        <fullName>CheckLeft</fullName>
        <field>Bat_W__c</field>
        <formula>LEFT( Bat_W__c ,100-5)</formula>
        <name>CheckLeft</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPDATE_HISTORY</fullName>
        <field>HISTORY_FIELD__c</field>
        <formula>IF(ISBLANK( HISTORY_FIELD__c) , 

(&quot;ACCOUNT NAME :&quot;  &amp; Name  &amp; &apos;,&apos;  &amp; &quot;Account Number :&quot;&amp; AccountNumber )
, 
(&quot;ACCOUNT NAME :&quot;  &amp; Name  &amp; &apos;,&apos;  &amp; &quot;Account Number :&quot;&amp; AccountNumber) &amp; BR() &amp;
  LEFT(HISTORY_FIELD__c,300-LEN(BR() &amp;&quot;ACCOUNT NAME :&quot;  &amp; Name  &amp; &apos;,&apos;  &amp; &quot;Account Number :&quot;&amp; AccountNumber)) 
)</formula>
        <name>UPDATE HISTORY</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>field_update</fullName>
        <field>Phone</field>
        <name>field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Sample_Outbound</fullName>
        <apiVersion>35.0</apiVersion>
        <endpointUrl>http://requestb.in/1kaanb21</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>AnnualRevenue</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>vinay@ganesh.com</integrationUser>
        <name>Sample Outbound</name>
        <protected>true</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>CREATE HISTORY ACCOUNT</fullName>
        <actions>
            <name>CheckLeft</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UPDATE_HISTORY</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Name)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Rating update</fullName>
        <actions>
            <name>Sample_Outbound</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.AnnualRevenue</field>
            <operation>greaterThan</operation>
            <value>1000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>NEW_TASK1</fullName>
        <assignedTo>ganesh@vinay254.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>NEW TASK1</subject>
    </tasks>
    <tasks>
        <fullName>TASK</fullName>
        <assignedTo>ganesh@vinay254.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>true</protected>
        <status>In Progress</status>
        <subject>TASK</subject>
    </tasks>
</Workflow>
