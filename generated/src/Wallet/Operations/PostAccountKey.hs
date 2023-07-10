-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation postAccountKey
module Wallet.Operations.PostAccountKey where

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

-- | > POST /wallets/{walletId}/keys/{index}
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- Derive an account public key for any account index. For this key derivation to be possible,
-- the wallet must have been created from mnemonic.
-- 
-- It is possible to use the optional \`purpose\` field to override that branch of the derivation path
-- with different hardened derivation index. If that field is omitted, the default purpose
-- for Cardano wallets (\`1852H\`) will be used.
-- 
-- \<b>Note:\<\/b> Only _Hardened_ indexes are supported by this endpoint.
postAccountKey :: forall m . Wallet.Common.MonadHTTP m => PostAccountKeyParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> PostAccountKeyRequestBody -- ^ The request body to send
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response PostAccountKeyResponse) -- ^ Monadic computation which returns the result of the operation
postAccountKey parameters
               body = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either PostAccountKeyResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 202) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse202 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                             Data.Text.Internal.Text)
                                                                                                                                                               | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                             PostAccountKeyResponseBody400)
                                                                                                                                                               | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                             PostAccountKeyResponseBody406)
                                                                                                                                                               | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                             PostAccountKeyResponseBody415)
                                                                                                                                                               | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathWalletId parameters))) GHC.Base.<> ("/keys/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathIndex parameters))) GHC.Base.<> "")))) GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.parameters@ in the specification.
-- 
-- 
data PostAccountKeyParameters = PostAccountKeyParameters {
  -- | pathIndex: Represents the parameter named \'index\'
  -- 
  -- An individual segment within a derivation path.
  -- 
  -- The \`H\` suffix indicates a _Hardened_ child private key, which
  -- means that children of this key cannot be derived from the public
  -- key. Indices without a \`H\` suffix are called _Soft_.
  postAccountKeyParametersPathIndex :: Data.Text.Internal.Text
  -- | pathWalletId: Represents the parameter named \'walletId\'
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 40
  -- * Minimum length of 40
  , postAccountKeyParametersPathWalletId :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyParameters
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["pathIndex" Data.Aeson.Types.ToJSON..= postAccountKeyParametersPathIndex obj] : ["pathWalletId" Data.Aeson.Types.ToJSON..= postAccountKeyParametersPathWalletId obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["pathIndex" Data.Aeson.Types.ToJSON..= postAccountKeyParametersPathIndex obj] : ["pathWalletId" Data.Aeson.Types.ToJSON..= postAccountKeyParametersPathWalletId obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyParameters
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountKeyParameters" (\obj -> (GHC.Base.pure PostAccountKeyParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathIndex")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathWalletId"))
-- | Create a new 'PostAccountKeyParameters' with all required fields.
mkPostAccountKeyParameters :: Data.Text.Internal.Text -- ^ 'postAccountKeyParametersPathIndex'
  -> Data.Text.Internal.Text -- ^ 'postAccountKeyParametersPathWalletId'
  -> PostAccountKeyParameters
mkPostAccountKeyParameters postAccountKeyParametersPathIndex postAccountKeyParametersPathWalletId = PostAccountKeyParameters{postAccountKeyParametersPathIndex = postAccountKeyParametersPathIndex,
                                                                                                                             postAccountKeyParametersPathWalletId = postAccountKeyParametersPathWalletId}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.requestBody.content.application\/json.schema@ in the specification.
-- 
-- 
data PostAccountKeyRequestBody = PostAccountKeyRequestBody {
  -- | format: Determines whether extended (with chain code) or normal (without chain code) key is requested
  postAccountKeyRequestBodyFormat :: PostAccountKeyRequestBodyFormat
  -- | passphrase: A master passphrase to lock and protect the wallet for sensitive operation (e.g. sending funds)
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 255
  -- * Minimum length of 10
  , postAccountKeyRequestBodyPassphrase :: Data.Text.Internal.Text
  -- | purpose: An individual segment within a derivation path.
  -- 
  -- The \`H\` suffix indicates a _Hardened_ child private key, which
  -- means that children of this key cannot be derived from the public
  -- key. Indices without a \`H\` suffix are called _Soft_.
  , postAccountKeyRequestBodyPurpose :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyRequestBody
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["format" Data.Aeson.Types.ToJSON..= postAccountKeyRequestBodyFormat obj] : ["passphrase" Data.Aeson.Types.ToJSON..= postAccountKeyRequestBodyPassphrase obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("purpose" Data.Aeson.Types.ToJSON..=)) (postAccountKeyRequestBodyPurpose obj) : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["format" Data.Aeson.Types.ToJSON..= postAccountKeyRequestBodyFormat obj] : ["passphrase" Data.Aeson.Types.ToJSON..= postAccountKeyRequestBodyPassphrase obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("purpose" Data.Aeson.Types.ToJSON..=)) (postAccountKeyRequestBodyPurpose obj) : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyRequestBody
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountKeyRequestBody" (\obj -> ((GHC.Base.pure PostAccountKeyRequestBody GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "format")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "passphrase")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "purpose"))
-- | Create a new 'PostAccountKeyRequestBody' with all required fields.
mkPostAccountKeyRequestBody :: PostAccountKeyRequestBodyFormat -- ^ 'postAccountKeyRequestBodyFormat'
  -> Data.Text.Internal.Text -- ^ 'postAccountKeyRequestBodyPassphrase'
  -> PostAccountKeyRequestBody
mkPostAccountKeyRequestBody postAccountKeyRequestBodyFormat postAccountKeyRequestBodyPassphrase = PostAccountKeyRequestBody{postAccountKeyRequestBodyFormat = postAccountKeyRequestBodyFormat,
                                                                                                                            postAccountKeyRequestBodyPassphrase = postAccountKeyRequestBodyPassphrase,
                                                                                                                            postAccountKeyRequestBodyPurpose = GHC.Maybe.Nothing}
-- | Defines the enum schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.requestBody.content.application\/json.schema.properties.format@ in the specification.
-- 
-- Determines whether extended (with chain code) or normal (without chain code) key is requested
data PostAccountKeyRequestBodyFormat =
   PostAccountKeyRequestBodyFormatOther Data.Aeson.Types.Internal.Value -- ^ This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
  | PostAccountKeyRequestBodyFormatTyped Data.Text.Internal.Text -- ^ This constructor can be used to send values to the server which are not present in the specification yet.
  | PostAccountKeyRequestBodyFormatEnumExtended -- ^ Represents the JSON value @"extended"@
  | PostAccountKeyRequestBodyFormatEnumNon_extended -- ^ Represents the JSON value @"non_extended"@
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyRequestBodyFormat
    where toJSON (PostAccountKeyRequestBodyFormatOther val) = val
          toJSON (PostAccountKeyRequestBodyFormatTyped val) = Data.Aeson.Types.ToJSON.toJSON val
          toJSON (PostAccountKeyRequestBodyFormatEnumExtended) = "extended"
          toJSON (PostAccountKeyRequestBodyFormatEnumNon_extended) = "non_extended"
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyRequestBodyFormat
    where parseJSON val = GHC.Base.pure (if | val GHC.Classes.== "extended" -> PostAccountKeyRequestBodyFormatEnumExtended
                                            | val GHC.Classes.== "non_extended" -> PostAccountKeyRequestBodyFormatEnumNon_extended
                                            | GHC.Base.otherwise -> PostAccountKeyRequestBodyFormatOther val)
-- | Represents a response of the operation 'postAccountKey'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PostAccountKeyResponseError' is used.
data PostAccountKeyResponse =
   PostAccountKeyResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | PostAccountKeyResponse202 Data.Text.Internal.Text -- ^ Accepted
  | PostAccountKeyResponse400 PostAccountKeyResponseBody400 -- ^ Bad Request
  | PostAccountKeyResponse406 PostAccountKeyResponseBody406 -- ^ Not Acceptable
  | PostAccountKeyResponse415 PostAccountKeyResponseBody415 -- ^ Unsupported Media Type
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data PostAccountKeyResponseBody400 = PostAccountKeyResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  postAccountKeyResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountKeyResponseBody400" (\obj -> GHC.Base.pure PostAccountKeyResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostAccountKeyResponseBody400' with all required fields.
mkPostAccountKeyResponseBody400 :: Data.Text.Internal.Text -- ^ 'postAccountKeyResponseBody400Message'
  -> PostAccountKeyResponseBody400
mkPostAccountKeyResponseBody400 postAccountKeyResponseBody400Message = PostAccountKeyResponseBody400{postAccountKeyResponseBody400Message = postAccountKeyResponseBody400Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data PostAccountKeyResponseBody406 = PostAccountKeyResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  postAccountKeyResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountKeyResponseBody406" (\obj -> GHC.Base.pure PostAccountKeyResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostAccountKeyResponseBody406' with all required fields.
mkPostAccountKeyResponseBody406 :: Data.Text.Internal.Text -- ^ 'postAccountKeyResponseBody406Message'
  -> PostAccountKeyResponseBody406
mkPostAccountKeyResponseBody406 postAccountKeyResponseBody406Message = PostAccountKeyResponseBody406{postAccountKeyResponseBody406Message = postAccountKeyResponseBody406Message}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/keys\/{index}.POST.responses.415.content.application\/json.schema@ in the specification.
-- 
-- 
data PostAccountKeyResponseBody415 = PostAccountKeyResponseBody415 {
  -- | code: A specific error code for this error, more precise than HTTP ones.
  postAccountKeyResponseBody415Code :: Data.Text.Internal.Text
  -- | message: A descriptive error message.
  , postAccountKeyResponseBody415Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON PostAccountKeyResponseBody415
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["code" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody415Code obj] : ["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody415Message obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["code" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody415Code obj] : ["message" Data.Aeson.Types.ToJSON..= postAccountKeyResponseBody415Message obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON PostAccountKeyResponseBody415
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountKeyResponseBody415" (\obj -> (GHC.Base.pure PostAccountKeyResponseBody415 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "code")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'PostAccountKeyResponseBody415' with all required fields.
mkPostAccountKeyResponseBody415 :: Data.Text.Internal.Text -- ^ 'postAccountKeyResponseBody415Code'
  -> Data.Text.Internal.Text -- ^ 'postAccountKeyResponseBody415Message'
  -> PostAccountKeyResponseBody415
mkPostAccountKeyResponseBody415 postAccountKeyResponseBody415Code postAccountKeyResponseBody415Message = PostAccountKeyResponseBody415{postAccountKeyResponseBody415Code = postAccountKeyResponseBody415Code,
                                                                                                                                       postAccountKeyResponseBody415Message = postAccountKeyResponseBody415Message}
-- | > POST /wallets/{walletId}/keys/{index}
-- 
-- The same as 'postAccountKey' but accepts an explicit configuration.
postAccountKeyWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> PostAccountKeyParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> PostAccountKeyRequestBody -- ^ The request body to send
  -> m (Network.HTTP.Client.Types.Response PostAccountKeyResponse) -- ^ Monadic computation which returns the result of the operation
postAccountKeyWithConfiguration config
                                parameters
                                body = GHC.Base.fmap (\response_5 -> GHC.Base.fmap (Data.Either.either PostAccountKeyResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_6 -> Network.HTTP.Types.Status.statusCode status_6 GHC.Classes.== 202) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse202 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              Data.Text.Internal.Text)
                                                                                                                                                                                | (\status_7 -> Network.HTTP.Types.Status.statusCode status_7 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              PostAccountKeyResponseBody400)
                                                                                                                                                                                | (\status_8 -> Network.HTTP.Types.Status.statusCode status_8 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              PostAccountKeyResponseBody406)
                                                                                                                                                                                | (\status_9 -> Network.HTTP.Types.Status.statusCode status_9 GHC.Classes.== 415) (Network.HTTP.Client.Types.responseStatus response) -> PostAccountKeyResponse415 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                              PostAccountKeyResponseBody415)
                                                                                                                                                                                | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_5) response_5) (Wallet.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathWalletId parameters))) GHC.Base.<> ("/keys/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathIndex parameters))) GHC.Base.<> "")))) GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | > POST /wallets/{walletId}/keys/{index}
-- 
-- The same as 'postAccountKey' but returns the raw 'Data.ByteString.ByteString'.
postAccountKeyRaw :: forall m . Wallet.Common.MonadHTTP m => PostAccountKeyParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> PostAccountKeyRequestBody -- ^ The request body to send
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
postAccountKeyRaw parameters
                  body = GHC.Base.id (Wallet.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathWalletId parameters))) GHC.Base.<> ("/keys/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathIndex parameters))) GHC.Base.<> "")))) GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
-- | > POST /wallets/{walletId}/keys/{index}
-- 
-- The same as 'postAccountKey' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
postAccountKeyWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> PostAccountKeyParameters -- ^ Contains all available parameters of this operation (query and path parameters)
  -> PostAccountKeyRequestBody -- ^ The request body to send
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
postAccountKeyWithConfigurationRaw config
                                   parameters
                                   body = GHC.Base.id (Wallet.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathWalletId parameters))) GHC.Base.<> ("/keys/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel (postAccountKeyParametersPathIndex parameters))) GHC.Base.<> "")))) GHC.Base.mempty (GHC.Maybe.Just body) Wallet.Common.RequestBodyEncodingJSON)
