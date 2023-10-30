import { LightningElement } from 'lwc';

export default class Welcome extends LightningElement {
    avatar='https://media.licdn.com/dms/image/D4D03AQES96d0gMUCQQ/profile-displayphoto-shrink_200_200/0/1677163017805?e=1704326400&v=beta&t=J7vzRLJT3rrCWwqJVRoCZKUlwYTsnZjjegJsmNpmZv8';
text;
countLength(event){
    this.text=event.detail.value;

}
}