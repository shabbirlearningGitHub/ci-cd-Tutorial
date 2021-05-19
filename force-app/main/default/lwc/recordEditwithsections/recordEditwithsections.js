import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordEditwithsections extends LightningElement {
    @track activeSections = [];
 
    fields_per_section = [
        {
            label: "Personal data",
            fields: [
                "Name"
               ]
        },
        {
            label: "Address",
            fields: [
                "BillingCity"
            ]
        },
        {
            label: "Contact Info",
            sublabel: "",
            fields: ["Phone",
                    "Email__C"]
        }
    ];
 
    handleCancel(event) {
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
 
    handleSuccess() {
        const event = new ShowToastEvent({
            variant: 'success',
            title: 'Success!',
            message: 'Record has been created',
        });
        this.dispatchEvent(event);
    }
}