import { LightningElement,api } from 'lwc';

export default class GenericLightningModal extends LightningElement {
    @api title;             // Pass title along with Modal Header as true check
    @api modalId;           // Pass modalId to uniquely Identify modal
    @api modalHeader;       // check to include Modal Header
    @api size;

    footerClass;
    get modalContentId()
    {
        return `modal-content-id-${this.modalId}`
    }
    handleCloseModal(event)
    {
        this.dispatchEvent(new CustomEvent('closemodal',{detail:this.modalId}));
    }

    handleFooterSlot(event)
    {
        const slot = event.target;
        console.log(slot);
        const hasFooter = slot.assignedElements().length!==0;
        this.footerClass = hasFooter ? 'slds-modal__footer':'' ;
    }

    get headerClass()
    {
        return (this.modalHeader ? 'slds-modal__header' : 'headerPosition');
    }

    get modalSize()
    {
        /*return (size==='small'?'slds-modal slds-fade-in-open slds-modal_small : 
                               size==='medium'?'slds-modal slds-fade-in-open slds-modal_medium:
                                size==='large'?slds-modal slds-fade-in-open slds-modal_large:'');*/
        return (this.size?'slds-modal slds-fade-in-open slds-modal_'+this.size.toLowerCase() : 'slds-modal slds-fade-in-open slds-modal_medium');
    }
}