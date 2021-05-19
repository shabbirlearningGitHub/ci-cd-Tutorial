<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="selectedLookUpRecords" type="sObject[]" default="[$UserInfo.getuserName]"/>
 
  <c:MultiLookupEx objectAPIName="account"
                               IconName="standard:account"
                               lstSelectedRecords="{!v.selectedLookUpRecords}"
                               label="Account Name"/>
   <!-- here c: is org. namespace prefix-->
</aura:application>