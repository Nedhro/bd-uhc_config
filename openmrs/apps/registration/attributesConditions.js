var showOrHideReferredBySection = function (patient) {
    var returnValues = {
        show: [],
        hide: []
    };
    if (patient["referredBy"].value == "Referred By, Hospital") {
        returnValues.show.push("hospitalSection");
        returnValues.hide.push("doctorSection", "pharmacySection", "promotionalActivitySection");
    } else if (patient["referredBy"].value == "Referred By, Pharmacy") {
        returnValues.show.push("pharmacySection");
        returnValues.hide.push("doctorSection", "hospitalSection", "promotionalActivitySection");
    } else if (patient["referredBy"].value == "Referred By, Promotional Activity") {
        returnValues.show.push("promotionalActivitySection");
        returnValues.hide.push("doctorSection", "hospitalSection", "pharmacySection");
    } else if (patient["referredBy"].value == "Referred By, Doctor") {
        returnValues.show.push("doctorSection");
        returnValues.hide.push("hospitalSection", "pharmacySection", "promotionalActivitySection");
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
        if (patient["patientCategory"].value == "Patient Category, MF") {
            returnValues.show.push("mfidSection");
            returnValues.hide.push("healthIdSection", "staffIdSection");
        } else if (patient["patientCategory"].value == "Patient Category, Health card holder") {
            returnValues.show.push("healthIdSection");
            returnValues.hide.push("mfidSection", "staffIdSection");
        } else if (patient["patientCategory"].value == "Patient Category, Staff, Self & family") {
            returnValues.show.push("staffIdSection");
            returnValues.hide.push("mfidSection", "healthIdSection");
        } else {
            returnValues.hide.push("staffIdSection", "mfidSection", "healthIdSection");
        }
        return returnValues;
    }
};