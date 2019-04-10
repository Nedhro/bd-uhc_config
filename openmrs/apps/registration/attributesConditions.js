var showOrHideReferredBySection = function (patient) {
    var returnValues = {
        show: [],
        hide: []
    };
    if (patient["referredBy"].value == "Hospital") {
        returnValues.show.push("hospitalSection");
        returnValues.hide.push("doctorSection");
    } else if (patient["referredBy"].value == "Doctor") {
        returnValues.show.push("doctorSection");
        returnValues.hide.push("hospitalSection");
    } else {
        returnValues.hide.push("hospitalSection", "doctorSection");
    }
    return returnValues
};

Bahmni.Registration.AttributesConditions.rules = {
    'referredBy': function (patient) {
        return showOrHideReferredBySection(patient);
    }
};