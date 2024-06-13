/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 * @NModuleScope SameAccount
 */


define(['N/record', 'N/search'], 
/**
 * @param{record} record
 * @param{search} search  

 */


// 20240227-122303
// 20240227-122444
// 20240228-132017
// 20240228-133410
// 20240228-205706 BA-110


function(record, search) {
    /**
     * Function to be executed after page is initialized.
     *
     * @param {Object} scriptContext
     * @param {Record} scriptContext.currentRecord - Current form record
     * @param {string} scriptContext.mode - The mode in which the record is being accessed (create, copy, or edit)
     *
     * @since 2015.2
     */
    function pageInit(scriptContext) {
        alert("Bonjour tout la monde")

    }
    return {
        pageInit: pageInit,
    };
});