var showOrHideReferredBySection = function (patient) {
    var returnValues = {
        show: [],
        hide: []
    };
    if (patient["referredBy"].value == "Hospital") {
        returnValues.show.push("hospitalSection");
        returnValues.hide.push("doctorSection");
        returnValues.hide.push("pharmacySection");
        returnValues.hide.push("promotionalActivitySection");
    } else if (patient["referredBy"].value == "Pharmacy") {
        returnValues.show.push("pharmacySection");
        returnValues.hide.push("doctorSection");
        returnValues.hide.push("hospitalSection");
        returnValues.hide.push("promotionalActivitySection");
    } else if (patient["referredBy"].value == "Promotional Activity") {
        returnValues.show.push("promotionalActivitySection");
        returnValues.hide.push("doctorSection");
        returnValues.hide.push("hospitalSection");
        returnValues.hide.push("pharmacySection");
    } else if (patient["referredBy"].value == "Doctor") {
        returnValues.show.push("doctorSection");
        returnValues.hide.push("hospitalSection");
        returnValues.hide.push("pharmacySection");
        returnValues.hide.push("promotionalActivitySection");
    } else {
        returnValues.hide.push("hospitalSection", "doctorSection", "pharmacySection", "promotionalActivitySection");
    }
    return returnValues
};

Bahmni.Registration.AttributesConditions.rules = {
    'referredBy': function (patient) {
        return showOrHideReferredBySection(patient);
    },
    'gender': function (patient) {
        var returnValues = {
            show: [],
            hide: []
        };
        if (patient.gender == "M") {
            patient.genderAttr = "Male";
            returnValues.hide.push("genderSection");
        } else if (patient.gender == "F") {
            patient.genderAttr = "Female";
            returnValues.hide.push("genderSection");
        } else if (patient.gender == "O") {
            patient.genderAttr = "Transgender";
            returnValues.hide.push("genderSection");
        } else {
            returnValues.hide.push("genderSection");
        }
        return returnValues;
    },
    'patientCategory': function (patient) {
        var returnValues = {
            show: [],
            hide: []
        };
        if (patient["patientCategory"].value == "MF") {
            returnValues.show.push("mfidSection");
            returnValues.hide.push("healthIdSection");
            returnValues.hide.push("staffIdSection");
        } else if (patient["patientCategory"].value == "Health card holder") {
            returnValues.show.push("healthIdSection");
            returnValues.hide.push("mfidSection");
            returnValues.hide.push("staffIdSection");

        } else if (patient["patientCategory"].value == "Staff, Self & family") {
            returnValues.show.push("staffIdSection");
            returnValues.hide.push("mfidSection");
            returnValues.hide.push("healthIdSection");
        } else {
            returnValues.hide.push("staffIdSection", "mfidSection", "healthIdSection");
        }
        return returnValues;
    }
};