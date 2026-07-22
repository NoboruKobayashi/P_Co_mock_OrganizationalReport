using job from '../db/schema';

// =============================================================================
// JobService : 職制表レポート「実行結果確認画面」用の OData v4 サービス
//
//   仕様書: 07_画面レイアウト定義_実行結果確認画面.md
//           08_画面項目定義_実行結果確認画面.md
//
//   本モックでは Fiori Elements (List Report + Object Page) の表示確認用途に限定し、
//   registerJob (Action) / downloadReport (Function) は宣言しない。
//   ドラフト機能 (@odata.draft.enabled) も付与しない (閲覧のみのため)。
// =============================================================================
service JobService {

  // Object Page 用: JobHeader そのものを公開 (キー: JobID)
  entity JobHeaders     as projection on job.JobHeader;

  // List Report 用: 表示用計算列 (Executor / TargetOrg / StatusText) 付きビュー
  entity JobHeaderViews as projection on job.JobHeaderView;

}
