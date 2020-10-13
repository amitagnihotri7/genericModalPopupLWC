import { LightningElement } from 'lwc';
export default class ParentCardComponent extends LightningElement {

    modalContent ={title:"abc"};
    showModalOpen = false;  // default close First Modal
    headlessModal = false;
    footerlessModal = false;
    handleButtonClick(event) 
    {   
        this[event.target.name]=true;
    }

    handleCloseModal(event)
    {
        const dt = event.target.dataset.modalId ? event.target.dataset.modalId : event.detail;
        this[dt] = false;
        // we are passing modal Id as a name here and closing modal;
    }

    handleSaveModal(event)
    {
        this[event.target.dataset.modalId] = false;
    }
}