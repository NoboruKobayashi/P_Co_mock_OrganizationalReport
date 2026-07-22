using JobService as service from '../../srv/service';
annotate service.JobHeaderViews with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ExecutorID,
            },
            {
                $Type : 'UI.DataField',
                Value : ExecutorName,
            },
            {
                $Type : 'UI.DataField',
                Value : Executor,
            },
            {
                $Type : 'UI.DataField',
                Value : CompanyName,
            },
            {
                $Type : 'UI.DataField',
                Value : BaseDate,
            },
            {
                $Type : 'UI.DataField',
                Value : TargetOrgCode,
            },
            {
                $Type : 'UI.DataField',
                Value : TargetOrgName,
            },
            {
                $Type : 'UI.DataField',
                Value : TargetOrg,
            },
            {
                $Type : 'UI.DataField',
                Value : OrgRankCode,
            },
            {
                $Type : 'UI.DataField',
                Value : OrgRankText,
            },
            {
                $Type : 'UI.DataField',
                Value : LeaderOnly,
            },
            {
                $Type : 'UI.DataField',
                Value : LeaderOnlyText,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : StatusText,
            },
            {
                $Type : 'UI.DataField',
                Value : Message,
            },
            {
                $Type : 'UI.DataField',
                Value : OutputFileRef,
            },
            {
                $Type : 'UI.DataField',
                Value : CreatedDatetime,
            },
            {
                $Type : 'UI.DataField',
                Value : ProcessingStartAt,
            },
            {
                $Type : 'UI.DataField',
                Value : ProcessingEndAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : JobID,
        },
        {
            $Type : 'UI.DataField',
            Value : Executor,
        },
        {
            $Type : 'UI.DataField',
            Value : CompanyName,
        },
        {
            $Type : 'UI.DataField',
            Value : CreatedDatetime,
        },
        {
            $Type : 'UI.DataField',
            Value : TargetOrg,
        },
        {
            $Type : 'UI.DataField',
            Value : BaseDate,
        },
        {
            $Type : 'UI.DataField',
            Value : StatusText,
        },
        {
            $Type : 'UI.DataField',
            Value : Message,
        },
    ],
    UI.SelectionFields : [
        ExecutorID,
        CreatedDatetime,
    ],
);

