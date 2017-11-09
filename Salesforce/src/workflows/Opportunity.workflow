<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approval_Request</fullName>
        <ccEmails>vinay.oy254@gmail.com</ccEmails>
        <description>Approval Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Opportunity_Discount_Approval_Confirmation</template>
    </alerts>
    <alerts>
        <fullName>My_emawil</fullName>
        <description>My emawil</description>
        <protected>false</protected>
        <recipients>
            <recipient>vinay@ganesh.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Discount_Approval_Confirmation</template>
    </alerts>
    <fieldUpdates>
        <fullName>FIELD_UPADTW_ON_Pre</fullName>
        <field>STAGE_PRE_VAL__c</field>
        <formula>PRIORVALUE(Amount)</formula>
        <name>FIELD UPADTW ON Pre</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU1</fullName>
        <field>STAGE_VALUE__c</field>
        <formula>PRIORVALUE(StageName)</formula>
        <name>FU1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rating</fullName>
        <field>Rating</field>
        <literalValue>Hot</literalValue>
        <name>Rating</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RatingOn_acc</fullName>
        <field>Rating</field>
        <literalValue>Hot</literalValue>
        <name>RatingOn acc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Approved</fullName>
        <field>Discount__c</field>
        <literalValue>Approved</literalValue>
        <name>Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Approved_Yes</fullName>
        <field>Discount__c</field>
        <literalValue>Approved</literalValue>
        <name>Status Approved Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Not_Approved</fullName>
        <field>Discount__c</field>
        <literalValue>Not Approved</literalValue>
        <name>Status Not Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Not_Approved_NO</fullName>
        <field>Discount__c</field>
        <literalValue>Not Approved</literalValue>
        <name>Status Not Approved NO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEMPUPDATE</fullName>
        <field>TOTALEMP__c</field>
        <formula>EMPLOYEES__c  +   TOT__r.TOTALEMP__c</formula>
        <name>TEMPUPDATE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UPDATE_END_DATE_CORRECT</fullName>
        <field>END_DATE_CORRECT__c</field>
        <formula>DATE(FLOOR(YEAR(START_DATE__c)+((MONTH(START_DATE__c)+MONTH_NUMBER1__c)/12)),
IF(MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c),12 )=0,1,
MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c ),12))
,
IF(
DAY(
START_DATE__c)&lt;=28,DAY(START_DATE__c),
IF(
AND(
DAY(START_DATE__c)=CASE(DAY(START_DATE__c),29,29,30,30,31),IF( 
MOD((MONTH(START_DATE__c)+MONTH_NUMBER1__c),12)=0,1,
MOD((MONTH(START_DATE__c)+MONTH_NUMBER1__c),12))=2),
IF(MOD(FLOOR(YEAR(START_DATE__c)+((MONTH(START_DATE__c)+MONTH_NUMBER1__c)/12)),4)=0,29,28),
IF((
DAY( START_DATE__c )=31 &amp;&amp;
IF( 
MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c),12 )=0,1,
MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c ) , 12))=CASE(IF( 
MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c),12 )=0,1,
MOD((MONTH(START_DATE__c)+ MONTH_NUMBER1__c ) , 12)),4,4,6,6,9,9,11
)
)
,30,CASE(DAY(START_DATE__c),29,29,30,30,31)
)
)
)
)</formula>
        <name>UPDATE END DATE CORRECT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>field_update</fullName>
        <field>START_DATE__c</field>
        <formula>CloseDate</formula>
        <name>field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>oy</fullName>
        <field>Name</field>
        <formula>Account.Phone</formula>
        <name>oy</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>OpptoAcc</fullName>
        <actions>
            <name>RatingOn_acc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>100000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>RULE 1</fullName>
        <actions>
            <name>FU1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.CloseDate</field>
            <operation>equals</operation>
            <value>12/23/2014</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>field update ONSD</fullName>
        <actions>
            <name>field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Prospecting,Qualification,Needs Analysis,Value Proposition,Id. Decision Makers,Perception Analysis,Proposal/Price Quote,Negotiation/Review,Closed Won,Closed Lost</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
