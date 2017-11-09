<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FIELD_UPDATE_END_DATE_CORRECT</fullName>
        <field>END_DATE_CORRECT__c</field>
        <formula>DATE(FLOOR(YEAR( ServiceDate )+((MONTH( ServiceDate )+MONTH_NUMBER_OPP__c)/12)),
IF(MOD((MONTH(ServiceDate)+  MONTH_NUMBER_OPP__c ),12 )=0,1,
MOD((MONTH(ServiceDate)+ MONTH_NUMBER_OPP__c ),12))
,
IF(
DAY(
ServiceDate)&lt;=28,DAY(ServiceDate),
IF(
AND(
DAY(ServiceDate)=CASE(DAY(ServiceDate),29,29,30,30,31),IF( 
MOD((MONTH(ServiceDate)+MONTH_NUMBER_OPP__c),12)=0,1,
MOD((MONTH(ServiceDate)+MONTH_NUMBER_OPP__c),12))=2),
IF(MOD(FLOOR(YEAR(ServiceDate)+((MONTH(ServiceDate)+MONTH_NUMBER_OPP__c)/12)),4)=0,29,28),
IF((
DAY(ServiceDate)=31 &amp;&amp;
IF( 
MOD((MONTH(ServiceDate)+ MONTH_NUMBER_OPP__c),12 )=0,1,
MOD((MONTH(ServiceDate)+ MONTH_NUMBER_OPP__c), 12))=CASE(IF( 
MOD((MONTH(ServiceDate)+ MONTH_NUMBER_OPP__c),12 )=0,1,
MOD((MONTH(ServiceDate)+ MONTH_NUMBER_OPP__c ) , 12)),4,4,6,6,9,9,11
)
)
,30,CASE(DAY(ServiceDate),29,29,30,30,31)
)
)
)
)</formula>
        <name>FIELD UPDATE END DATE CORRECT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>field_update</fullName>
        <field>OPP_VINAY__c</field>
        <formula>Opportunity.CloseDate</formula>
        <name>field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>hjkh6</fullName>
        <field>OPP_VINAY__c</field>
        <formula>Opportunity.CloseDate</formula>
        <name>hjkh</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>rtyry</fullName>
        <field>OPP_VINAY__c</field>
        <formula>Opportunity.CloseDate</formula>
        <name>rtyry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>OOP PRO FIELD UPDATE</fullName>
        <actions>
            <name>field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Existing Customer - Upgrade,Existing Customer - Replacement,Existing Customer - Downgrade,New Customer</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UPDATE OOP PRODUCT END DATE</fullName>
        <actions>
            <name>FIELD_UPDATE_END_DATE_CORRECT</name>
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
