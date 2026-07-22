sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"panasonic/sf/organizationalreport/jobmonitoruiorganizationalreport/test/integration/pages/JobHeaderViewsList.gen",
	"panasonic/sf/organizationalreport/jobmonitoruiorganizationalreport/test/integration/pages/JobHeaderViewsObjectPage.gen"
], function (JourneyRunner, JobHeaderViewsListGenerated, JobHeaderViewsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('panasonic/sf/organizationalreport/jobmonitoruiorganizationalreport') + '/test/flp.html#app-preview',
        pages: {
			onTheJobHeaderViewsListGenerated: JobHeaderViewsListGenerated,
			onTheJobHeaderViewsObjectPageGenerated: JobHeaderViewsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

