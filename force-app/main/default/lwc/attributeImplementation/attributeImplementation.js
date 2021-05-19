import { LightningElement,api, track } from 'lwc';
import Id from '@salesforce/user/Id';
export default class AttributeImplementation extends LightningElement {
    @api name ;
    @track userId = Id;

    callfunction(){

        console.log('callfunction calling');        
        this.name =  'Shabbir Ali Khan';
    }
}