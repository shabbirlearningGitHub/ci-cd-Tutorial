import { LightningElement , track} from 'lwc';

export default class Helloworld extends LightningElement {
    @track greeting = 'World';
     @track contacts=[
      {
        Id:'12142342352',
        name:'shabbir'
      },
      {
        Id:'12142342352234',
        name:'shabbir Ali Khan'
      }
    ];
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}