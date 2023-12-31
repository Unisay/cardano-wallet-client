-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation getUTxOsStatistics
module Wallet.Operations.GetUTxOsStatistics where

import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe
import qualified Control.Monad.Fail
import qualified Control.Monad.Trans.Reader
import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Encoding.Internal
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.ByteString
import qualified Data.ByteString as Data.ByteString.Internal
import qualified Data.ByteString as Data.ByteString.Internal.Type
import qualified Data.Either
import qualified Data.Foldable
import qualified Data.Functor
import qualified Data.Maybe
import qualified Data.Scientific
import qualified Data.Text
import qualified Data.Text.Internal
import qualified Data.Time.Calendar as Data.Time.Calendar.Days
import qualified Data.Time.LocalTime as Data.Time.LocalTime.Internal.ZonedTime
import qualified Data.Vector
import qualified GHC.Base
import qualified GHC.Classes
import qualified GHC.Int
import qualified GHC.Show
import qualified GHC.Types
import qualified Network.HTTP.Client
import qualified Network.HTTP.Client as Network.HTTP.Client.Request
import qualified Network.HTTP.Client as Network.HTTP.Client.Types
import qualified Network.HTTP.Simple
import qualified Network.HTTP.Types
import qualified Network.HTTP.Types as Network.HTTP.Types.Status
import qualified Network.HTTP.Types as Network.HTTP.Types.URI
import qualified Wallet.Common
import Wallet.Types

-- | > GET /wallets/{walletId}/statistics/utxos
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Return the UTxO distribution across the whole wallet, in the form of a histogram.
-- 
-- \`\`\`
--      │
--  100 ─
--      │
--      │                                 ┌───┐
--   10 ─                         ┌───┐   │   │                   ┌───┐
--      │                 ┌───┐   │   │   │   │                   │   │
--      │                 │   │   │   │   │   │   ┌───┐           │   │
--    1 ─ ┌───┐           │   │   │   │   │   │   │   │           │   │
--      │ │   │           │   │   │   │   │   │   │   │           │   │
--      │ │   │ │       │ │   │ │ │   │ ╷ │   │ ╷ │   │ ╷       ╷ │   │
--      └─┘   └─│───────│─┘   └─│─┘   └─│─┘   └─│─┘   └─│───────│─┘   └────
--            10μ₳    100μ₳   1000μ₳   0.1₳    1₳      10₳     100₳
-- \`\`\`
getUTxOsStatistics :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response GetUTxOsStatisticsResponse) -- ^ Monadic computation which returns the result of the operation
getUTxOsStatistics walletId = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either GetUTxOsStatisticsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                             GetUTxOsStatisticsResponseBody200)
                                                                                                                                                                           | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                             GetUTxOsStatisticsResponseBody404)
                                                                                                                                                                           | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                             GetUTxOsStatisticsResponseBody406)
                                                                                                                                                                           | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/statistics/utxos")) GHC.Base.mempty)
-- | Represents a response of the operation 'getUTxOsStatistics'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetUTxOsStatisticsResponseError' is used.
data GetUTxOsStatisticsResponse =
   GetUTxOsStatisticsResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | GetUTxOsStatisticsResponse200 GetUTxOsStatisticsResponseBody200 -- ^ Ok
  | GetUTxOsStatisticsResponse404 GetUTxOsStatisticsResponseBody404 -- ^ Not Found
  | GetUTxOsStatisticsResponse406 GetUTxOsStatisticsResponseBody406 -- ^ Not Acceptable
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/statistics\/utxos.GET.responses.200.content.application\/json.schema@ in the specification.
-- 
-- 
data GetUTxOsStatisticsResponseBody200 = GetUTxOsStatisticsResponseBody200 {
  -- | distribution
  getUTxOsStatisticsResponseBody200Distribution :: Data.Aeson.Types.Internal.Object
  -- | total: Coins, in Lovelace. Only relates to \'Ada\'. Refer to \`assets\` for multi-assets wallets instead.
  , getUTxOsStatisticsResponseBody200Total :: GetUTxOsStatisticsResponseBody200Total
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetUTxOsStatisticsResponseBody200
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["distribution" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200Distribution obj] : ["total" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200Total obj] : ["scale" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "log10"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["distribution" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200Distribution obj] : ["total" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200Total obj] : ["scale" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "log10"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetUTxOsStatisticsResponseBody200
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetUTxOsStatisticsResponseBody200" (\obj -> (GHC.Base.pure GetUTxOsStatisticsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "distribution")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "total"))
-- | Create a new 'GetUTxOsStatisticsResponseBody200' with all required fields.
mkGetUTxOsStatisticsResponseBody200 :: Data.Aeson.Types.Internal.Object -- ^ 'getUTxOsStatisticsResponseBody200Distribution'
  -> GetUTxOsStatisticsResponseBody200Total -- ^ 'getUTxOsStatisticsResponseBody200Total'
  -> GetUTxOsStatisticsResponseBody200
mkGetUTxOsStatisticsResponseBody200 getUTxOsStatisticsResponseBody200Distribution getUTxOsStatisticsResponseBody200Total = GetUTxOsStatisticsResponseBody200{getUTxOsStatisticsResponseBody200Distribution = getUTxOsStatisticsResponseBody200Distribution,
                                                                                                                                                             getUTxOsStatisticsResponseBody200Total = getUTxOsStatisticsResponseBody200Total}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/statistics\/utxos.GET.responses.200.content.application\/json.schema.properties.total@ in the specification.
-- 
-- Coins, in Lovelace. Only relates to \'Ada\'. Refer to \`assets\` for multi-assets wallets instead.
data GetUTxOsStatisticsResponseBody200Total = GetUTxOsStatisticsResponseBody200Total {
  -- | quantity
  -- 
  -- Constraints:
  -- 
  -- * Minimum  of 0.0
  getUTxOsStatisticsResponseBody200TotalQuantity :: GHC.Types.Int
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetUTxOsStatisticsResponseBody200Total
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["quantity" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200TotalQuantity obj] : ["unit" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "lovelace"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["quantity" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody200TotalQuantity obj] : ["unit" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "lovelace"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetUTxOsStatisticsResponseBody200Total
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetUTxOsStatisticsResponseBody200Total" (\obj -> GHC.Base.pure GetUTxOsStatisticsResponseBody200Total GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "quantity"))
-- | Create a new 'GetUTxOsStatisticsResponseBody200Total' with all required fields.
mkGetUTxOsStatisticsResponseBody200Total :: GHC.Types.Int -- ^ 'getUTxOsStatisticsResponseBody200TotalQuantity'
  -> GetUTxOsStatisticsResponseBody200Total
mkGetUTxOsStatisticsResponseBody200Total getUTxOsStatisticsResponseBody200TotalQuantity = GetUTxOsStatisticsResponseBody200Total{getUTxOsStatisticsResponseBody200TotalQuantity = getUTxOsStatisticsResponseBody200TotalQuantity}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/statistics\/utxos.GET.responses.404.content.application\/json.schema@ in the specification.
-- 
-- 
data GetUTxOsStatisticsResponseBody404 = GetUTxOsStatisticsResponseBody404 {
  -- | message: May occur when a given walletId does not match with any known
  -- wallets (because it has been deleted, or has never existed).
  getUTxOsStatisticsResponseBody404Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetUTxOsStatisticsResponseBody404
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "no_such_wallet"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "no_such_wallet"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetUTxOsStatisticsResponseBody404
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetUTxOsStatisticsResponseBody404" (\obj -> GHC.Base.pure GetUTxOsStatisticsResponseBody404 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetUTxOsStatisticsResponseBody404' with all required fields.
mkGetUTxOsStatisticsResponseBody404 :: Data.Text.Internal.Text -- ^ 'getUTxOsStatisticsResponseBody404Message'
  -> GetUTxOsStatisticsResponseBody404
mkGetUTxOsStatisticsResponseBody404 getUTxOsStatisticsResponseBody404Message = GetUTxOsStatisticsResponseBody404{getUTxOsStatisticsResponseBody404Message = getUTxOsStatisticsResponseBody404Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/statistics\/utxos.GET.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data GetUTxOsStatisticsResponseBody406 = GetUTxOsStatisticsResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  getUTxOsStatisticsResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetUTxOsStatisticsResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= getUTxOsStatisticsResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetUTxOsStatisticsResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetUTxOsStatisticsResponseBody406" (\obj -> GHC.Base.pure GetUTxOsStatisticsResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'GetUTxOsStatisticsResponseBody406' with all required fields.
mkGetUTxOsStatisticsResponseBody406 :: Data.Text.Internal.Text -- ^ 'getUTxOsStatisticsResponseBody406Message'
  -> GetUTxOsStatisticsResponseBody406
mkGetUTxOsStatisticsResponseBody406 getUTxOsStatisticsResponseBody406Message = GetUTxOsStatisticsResponseBody406{getUTxOsStatisticsResponseBody406Message = getUTxOsStatisticsResponseBody406Message}
-- | > GET /wallets/{walletId}/statistics/utxos
-- 
-- The same as 'getUTxOsStatistics' but accepts an explicit configuration.
getUTxOsStatisticsWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response GetUTxOsStatisticsResponse) -- ^ Monadic computation which returns the result of the operation
getUTxOsStatisticsWithConfiguration config
                                    walletId = GHC.Base.fmap (\response_4 -> GHC.Base.fmap (Data.Either.either GetUTxOsStatisticsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                              GetUTxOsStatisticsResponseBody200)
                                                                                                                                                                                            | (\status_6 -> Network.HTTP.Types.Status.statusCode status_6 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                              GetUTxOsStatisticsResponseBody404)
                                                                                                                                                                                            | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> GetUTxOsStatisticsResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                              GetUTxOsStatisticsResponseBody406)
                                                                                                                                                                                            | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_4) response_4) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/statistics/utxos")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/statistics/utxos
-- 
-- The same as 'getUTxOsStatistics' but returns the raw 'Data.ByteString.ByteString'.
getUTxOsStatisticsRaw :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getUTxOsStatisticsRaw walletId = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/statistics/utxos")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/statistics/utxos
-- 
-- The same as 'getUTxOsStatistics' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
getUTxOsStatisticsWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getUTxOsStatisticsWithConfigurationRaw config
                                       walletId = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/statistics/utxos")) GHC.Base.mempty)
