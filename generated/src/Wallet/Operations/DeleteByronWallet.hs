-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation deleteByronWallet
module Wallet.Operations.DeleteByronWallet where

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

-- | > DELETE /byron-wallets/{walletId}
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Delete a Byron wallet.
deleteByronWallet :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response DeleteByronWalletResponse) -- ^ Monadic computation which returns the result of the operation
deleteByronWallet walletId = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either DeleteByronWalletResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 204) (Network.HTTP.Client.Types.responseStatus response) -> Data.Either.Right DeleteByronWalletResponse204
                                                                                                                                                                         | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                          DeleteByronWalletResponseBody400)
                                                                                                                                                                         | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                          DeleteByronWalletResponseBody404)
                                                                                                                                                                         | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                          DeleteByronWalletResponseBody406)
                                                                                                                                                                         | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") ("/byron-wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | Represents a response of the operation 'deleteByronWallet'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'DeleteByronWalletResponseError' is used.
data DeleteByronWalletResponse =
   DeleteByronWalletResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | DeleteByronWalletResponse204 -- ^ No Content
  | DeleteByronWalletResponse400 DeleteByronWalletResponseBody400 -- ^ Bad Request
  | DeleteByronWalletResponse404 DeleteByronWalletResponseBody404 -- ^ Not Found
  | DeleteByronWalletResponse406 DeleteByronWalletResponseBody406 -- ^ Not Acceptable
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/byron-wallets\/{walletId}.DELETE.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data DeleteByronWalletResponseBody400 = DeleteByronWalletResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  deleteByronWalletResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON DeleteByronWalletResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON DeleteByronWalletResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "DeleteByronWalletResponseBody400" (\obj -> GHC.Base.pure DeleteByronWalletResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'DeleteByronWalletResponseBody400' with all required fields.
mkDeleteByronWalletResponseBody400 :: Data.Text.Internal.Text -- ^ 'deleteByronWalletResponseBody400Message'
  -> DeleteByronWalletResponseBody400
mkDeleteByronWalletResponseBody400 deleteByronWalletResponseBody400Message = DeleteByronWalletResponseBody400{deleteByronWalletResponseBody400Message = deleteByronWalletResponseBody400Message}
-- | Defines the object schema located at @paths.\/byron-wallets\/{walletId}.DELETE.responses.404.content.application\/json.schema@ in the specification.
-- 
-- 
data DeleteByronWalletResponseBody404 = DeleteByronWalletResponseBody404 {
  -- | message: May occur when a given walletId does not match with any known
  -- wallets (because it has been deleted, or has never existed).
  deleteByronWalletResponseBody404Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON DeleteByronWalletResponseBody404
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "no_such_wallet"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody404Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "no_such_wallet"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON DeleteByronWalletResponseBody404
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "DeleteByronWalletResponseBody404" (\obj -> GHC.Base.pure DeleteByronWalletResponseBody404 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'DeleteByronWalletResponseBody404' with all required fields.
mkDeleteByronWalletResponseBody404 :: Data.Text.Internal.Text -- ^ 'deleteByronWalletResponseBody404Message'
  -> DeleteByronWalletResponseBody404
mkDeleteByronWalletResponseBody404 deleteByronWalletResponseBody404Message = DeleteByronWalletResponseBody404{deleteByronWalletResponseBody404Message = deleteByronWalletResponseBody404Message}
-- | Defines the object schema located at @paths.\/byron-wallets\/{walletId}.DELETE.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data DeleteByronWalletResponseBody406 = DeleteByronWalletResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  deleteByronWalletResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON DeleteByronWalletResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= deleteByronWalletResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON DeleteByronWalletResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "DeleteByronWalletResponseBody406" (\obj -> GHC.Base.pure DeleteByronWalletResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'DeleteByronWalletResponseBody406' with all required fields.
mkDeleteByronWalletResponseBody406 :: Data.Text.Internal.Text -- ^ 'deleteByronWalletResponseBody406Message'
  -> DeleteByronWalletResponseBody406
mkDeleteByronWalletResponseBody406 deleteByronWalletResponseBody406Message = DeleteByronWalletResponseBody406{deleteByronWalletResponseBody406Message = deleteByronWalletResponseBody406Message}
-- | > DELETE /byron-wallets/{walletId}
-- 
-- The same as 'deleteByronWallet' but accepts an explicit configuration.
deleteByronWalletWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response DeleteByronWalletResponse) -- ^ Monadic computation which returns the result of the operation
deleteByronWalletWithConfiguration config
                                   walletId = GHC.Base.fmap (\response_5 -> GHC.Base.fmap (Data.Either.either DeleteByronWalletResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_6 -> Network.HTTP.Types.Status.statusCode status_6 GHC.Classes.== 204) (Network.HTTP.Client.Types.responseStatus response) -> Data.Either.Right DeleteByronWalletResponse204
                                                                                                                                                                                          | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                           DeleteByronWalletResponseBody400)
                                                                                                                                                                                          | (\status_8 -> Network.HTTP.Types.Status.statusCode status_8 GHC.Classes.== 404) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse404 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                           DeleteByronWalletResponseBody404)
                                                                                                                                                                                          | (\status_9 -> Network.HTTP.Types.Status.statusCode status_9 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> DeleteByronWalletResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                           DeleteByronWalletResponseBody406)
                                                                                                                                                                                          | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_5) response_5) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") ("/byron-wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | > DELETE /byron-wallets/{walletId}
-- 
-- The same as 'deleteByronWallet' but returns the raw 'Data.ByteString.ByteString'.
deleteByronWalletRaw :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
deleteByronWalletRaw walletId = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") ("/byron-wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | > DELETE /byron-wallets/{walletId}
-- 
-- The same as 'deleteByronWallet' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
deleteByronWalletWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
deleteByronWalletWithConfigurationRaw config
                                      walletId = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") ("/byron-wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "")) GHC.Base.mempty)