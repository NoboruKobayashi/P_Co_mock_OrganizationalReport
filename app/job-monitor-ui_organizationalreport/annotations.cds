using JobService as service from '../../srv/service';
annotate service.JobHeaderViews with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
                Value : OrgRankText,
            },
            {
                $Type : 'UI.DataField',
                Value : LeaderOnly,
                Label : '出力区分（責任者のみ）',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'ジョブ情報',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '処理結果',
            ID : '_',
            Target : '@UI.FieldGroup#_',
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
    UI.FieldGroup #_ : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ProcessingStartAt,
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
    },
    UI.DeleteHidden : true,
);

