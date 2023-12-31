-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation getSettings
module Wallet.Operations.GetSettings where

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

-- | > GET /settings
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Return the current settings.
getSettings :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response GetSettingsResponse) -- ^ Monadic computation which returns the result of the operation
getSettings = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either GetSettingsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetSettingsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                               GetSettingsResponseBody200)
                                                                                                                                                    | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") "/settings" GHC.Base.mempty)
-- | Represents a response of the operation 'getSettings'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetSettingsResponseError' is used.
data GetSettingsResponse =
   GetSettingsResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | GetSettingsResponse200 GetSettingsResponseBody200 -- ^ Ok
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/settings.GET.responses.200.content.application\/json.schema@ in the specification.
-- 
-- 
data GetSettingsResponseBody200 = GetSettingsResponseBody200 {
  -- | pool_metadata_source: Pool metadata source. This sets the metadata fetching strategy.
  -- 
  -- Possible values are
  --   * none -> no fetching
  --   * direct -> direct fetching
  --   * uri -> use SMASH server
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Must match pattern \'^(none|direct|https?:\\\/\\\/[a-zA-Z0-9-_~.]+(:[0-9]+)?\/?)\$\'
  getSettingsResponseBody200Pool_metadata_source :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON GetSettingsResponseBody200
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["pool_metadata_source" Data.Aeson.Types.ToJSON..= getSettingsResponseBody200Pool_metadata_source obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["pool_metadata_source" Data.Aeson.Types.ToJSON..= getSettingsResponseBody200Pool_metadata_source obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON GetSettingsResponseBody200
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "GetSettingsResponseBody200" (\obj -> GHC.Base.pure GetSettingsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pool_metadata_source"))
-- | Create a new 'GetSettingsResponseBody200' with all required fields.
mkGetSettingsResponseBody200 :: Data.Text.Internal.Text -- ^ 'getSettingsResponseBody200Pool_metadata_source'
  -> GetSettingsResponseBody200
mkGetSettingsResponseBody200 getSettingsResponseBody200Pool_metadata_source = GetSettingsResponseBody200{getSettingsResponseBody200Pool_metadata_source = getSettingsResponseBody200Pool_metadata_source}
-- | > GET /settings
-- 
-- The same as 'getSettings' but accepts an explicit configuration.
getSettingsWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> m (Network.HTTP.Client.Types.Response GetSettingsResponse) -- ^ Monadic computation which returns the result of the operation
getSettingsWithConfiguration config = GHC.Base.fmap (\response_2 -> GHC.Base.fmap (Data.Either.either GetSettingsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> GetSettingsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                       GetSettingsResponseBody200)
                                                                                                                                                                            | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_2) response_2) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") "/settings" GHC.Base.mempty)
-- | > GET /settings
-- 
-- The same as 'getSettings' but returns the raw 'Data.ByteString.ByteString'.
getSettingsRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getSettingsRaw = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") "/settings" GHC.Base.mempty)
-- | > GET /settings
-- 
-- The same as 'getSettings' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
getSettingsWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
getSettingsWithConfigurationRaw config = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") "/settings" GHC.Base.mempty)
