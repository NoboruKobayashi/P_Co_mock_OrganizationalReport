namespace job;

using {managed} from '@sap/cds/common';

// =============================================================================
// JobHeader : 職制表レポート ジョブ単位(1ジョブ=1レポート)のメタ情報
//
//   仕様書: 18_補足_基本設計.md - 18.2.1 ジョブヘッダテーブル
//   ステータス値: 18.2.2 を参照
//
//   ※ 本機能では JobDetail は使用しない(18.2.3)。1ジョブ=1レポートのため、
//      処理結果メッセージ・出力ファイル参照は本テーブルに集約する。
// =============================================================================
entity JobHeader : managed {
     key JobID              : UUID                                    @Common.Label : 'ジョブID';

         // -- 実行者 ---------------------------------------------------------
         ExecutorID          : String(80)                             @Common.Label : '実行者ID';
         ExecutorName        : String(200)                            @Common.Label : '実行者名';
         CompanyName         : String(200)                            @Common.Label : '所属会社';

         // -- 実行条件 -------------------------------------------------------
         BaseDate            : Date                                   @Common.Label : '基準日';
         TargetOrgCode       : String(20)                             @Common.Label : '対象組織コード';
         TargetOrgName       : String(200)                            @Common.Label : '対象組織名';
         OrgRankCode         : String(10)                             @Common.Label : '組織格コード';
         OrgRankText         : String(200)                            @Common.Label : '組織格';
         LeaderOnly          : Boolean default false                  @Common.Label : '責任者のみ';
         LeaderOnlyText      : String(50)                             @Common.Label : '出力区分';

         // -- ステータス -----------------------------------------------------
         //   本機能は 1ジョブ=1レポート のため部分成功は存在せず、
         //   COMPLETED は常に「完了」表示(18.2.2)。色分けは行わない(08.1 R010)。
         @Common.Label : 'ステータス'
         Status              : String(20) enum {
              READY;      // ジョブ登録直後(registerJob 完了時点)
              PROCESSING; // processReportJob 実行中(SFs Read / Excel生成 / Object Store 格納中)
              COMPLETED;  // 全処理が正常終了
              ERROR;      // SFs API/Excel生成/Object Store 格納/システム例外でジョブ中断
         };

         // -- 結果 -----------------------------------------------------------
         Message             : String(2000)                           @Common.Label : 'メッセージ';
         //   処理結果メッセージ。正常時はブランクまたは完了通知、エラー時は内容を保存。

         OutputFileRef       : String(500)                            @Common.Label : '出力ファイル参照';
         //   Object Store 上のオブジェクトキー。COMPLETED 時のみ設定。

         // -- 日時 -----------------------------------------------------------
         CreatedDatetime     : Timestamp                              @Common.Label : 'ジョブ登録日時'; // registerJob 実行時刻
         ProcessingStartAt   : Timestamp                              @Common.Label : '開始日時';       // PROCESSING 遷移時刻
         ProcessingEndAt     : Timestamp                              @Common.Label : '完了日時';       // 最終ステータス確定時刻
}

// =============================================================================
// View: List Report / Object Page 用 (JobHeader に表示用計算列を付与)
//
//   仕様書: 18_補足_基本設計.md - 18.2.1「画面表示用ビュー(JobHeaderView)」
//     Executor    = ExecutorName || '(' || ExecutorID || ')'
//     TargetOrg   = TargetOrgCode || ' ' || TargetOrgName
//     StatusText  = Status を日本語ラベルに変換(READY→「登録済」他)
//
//   ※ StatusCriticality(色分け信号)は本機能では行わない(08.1 R010)。
//   ※ 件数集計列は本機能では不要(1ジョブ=1レポート、JobDetail 無し)。
// =============================================================================
view JobHeaderView as
     select from JobHeader as h {
          key h.JobID                                                  @(Common.Label : 'ジョブID'),

              // ===== 実行者 =====
              h.ExecutorID                                             @(Common.Label : '実行者ID'),
              h.ExecutorName                                           @(Common.Label : '実行者名'),
              h.ExecutorName || '(' || h.ExecutorID || ')'              as Executor       : String(285) @(Common.Label : '実行者'),
              h.CompanyName                                            @(Common.Label : '所属会社'),

              // ===== 実行条件 =====
              h.BaseDate                                               @(Common.Label : '基準日'),
              h.TargetOrgCode                                          @(Common.Label : '対象組織コード'),
              h.TargetOrgName                                          @(Common.Label : '対象組織名'),
              h.TargetOrgCode || ' ' || h.TargetOrgName                 as TargetOrg      : String(221) @(Common.Label : '対象組織'),
              h.OrgRankCode                                            @(Common.Label : '組織格コード'),
              h.OrgRankText                                            @(Common.Label : '組織格'),
              h.LeaderOnly                                             @(Common.Label : '責任者のみ'),
              h.LeaderOnlyText                                         @(Common.Label : '出力区分'),

              // ===== ステータス =====
              h.Status                                                 @(Common.Label : 'ステータス'),

              // 18.2.2 ステータス値と画面表示の対応
              case
                   when h.Status = 'READY'      then '登録済'
                   when h.Status = 'PROCESSING' then '処理中'
                   when h.Status = 'COMPLETED'  then '完了'
                   when h.Status = 'ERROR'      then 'エラー'
                   else ''
              end                                                       as StatusText     : String(10)  @(Common.Label : 'ステータス'),

              // ===== 結果 =====
              h.Message                                                @(Common.Label : 'メッセージ'),
              h.OutputFileRef                                          @(Common.Label : '出力ファイル参照'),

              // ===== 日時 =====
              h.CreatedDatetime                                        @(Common.Label : 'ジョブ登録日時'),
              h.ProcessingStartAt                                      @(Common.Label : '開始日時'),
              h.ProcessingEndAt                                        @(Common.Label : '完了日時')
     };
