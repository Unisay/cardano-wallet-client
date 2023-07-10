-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation listAssets
module Wallet.Operations.ListAssets where

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

-- | > GET /wallets/{walletId}/assets
-- 
-- List all assets associated with the wallet, and their metadata
-- if known.
-- 
-- An asset is _associated_ with a wallet if, at one point in history,
-- it was spendable by the wallet.
listAssets :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response ListAssetsResponse) -- ^ Monadic computation which returns the result of the operation
listAssets walletId = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either ListAssetsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> ListAssetsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                     ([ListAssetsResponseBody200]))
                                                                                                                                                           | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> ListAssetsResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                     ListAssetsResponseBody406)
                                                                                                                                                           | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/assets")) GHC.Base.mempty)
-- | Represents a response of the operation 'listAssets'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'ListAssetsResponseError' is used.
data ListAssetsResponse =
   ListAssetsResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | ListAssetsResponse200 ([ListAssetsResponseBody200]) -- ^ Ok
  | ListAssetsResponse406 ListAssetsResponseBody406 -- ^ Not Acceptable
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets.GET.responses.200.content.application\/json.schema.items@ in the specification.
-- 
-- 
data ListAssetsResponseBody200 = ListAssetsResponseBody200 {
  -- | asset_name: The asset on-chain type which acts as a sub-identifier within a
  -- policy. Although we call it \"asset name\", the value needn\'t be
  -- text, and it could even be empty.
  -- 
  -- For policies with a single fungible asset item, asset name is
  -- typically an empty string.
  -- 
  -- This value can be up to 32 bytes of arbitrary data (which is 64
  -- hexadecimal digits).
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 64
  listAssetsResponseBody200Asset_name :: Data.Text.Internal.Text
  -- | fingerprint: A user-facing short fingerprint which combines the \`policy_id\` and \`asset_name\`
  -- to allow for an easier human comparison of assets. Note that it is generally
  -- **not okay** to use this fingerprint as a unique identifier for it is not collision
  -- resistant. Yet within the context of a single wallet, it makes for a (rather)
  -- short user-facing comparison mean.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 44
  -- * Minimum length of 44
  -- * Must match pattern \'^(asset)1[0-9a-z]*\$\'
  , listAssetsResponseBody200Fingerprint :: Data.Text.Internal.Text
  -- | metadata: In the Mary era of Cardano, UTxO may contain native assets. These
  -- assets are represented on-chain by opaque identifiers which are
  -- meaningless to end-users. Therefore, user-facing metadata
  -- regarding each token must be stored off-chain, in a metadata
  -- registry.
  -- 
  -- Token creators may publish metadata into the registry and client
  -- applications can consume these metadata for display to end
  -- users. This will work in a similar way to how it is done for stake
  -- pool metadata.
  , listAssetsResponseBody200Metadata :: (GHC.Maybe.Maybe ListAssetsResponseBody200Metadata)
  -- | metadata_error: If there was an error fetching metadata from the server,
  -- this will be set to one of \`fetch\` or \`parse\`, to indicate
  -- the kind of error.
  , listAssetsResponseBody200Metadata_error :: (GHC.Maybe.Maybe ListAssetsResponseBody200Metadata_error)
  -- | policy_id: A unique identifier of the asset\'s monetary policy. The policy
  -- controls how assets of this kind are created and destroyed.
  -- 
  -- The contents are the blake2b-224 hash of the monetary policy
  -- script, encoded in hexadecimal.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 56
  -- * Minimum length of 56
  , listAssetsResponseBody200Policy_id :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON ListAssetsResponseBody200
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["asset_name" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Asset_name obj] : ["fingerprint" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Fingerprint obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200Metadata obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata_error" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200Metadata_error obj) : ["policy_id" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Policy_id obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["asset_name" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Asset_name obj] : ["fingerprint" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Fingerprint obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200Metadata obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("metadata_error" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200Metadata_error obj) : ["policy_id" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200Policy_id obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON ListAssetsResponseBody200
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "ListAssetsResponseBody200" (\obj -> ((((GHC.Base.pure ListAssetsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "asset_name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "fingerprint")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "metadata")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "metadata_error")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "policy_id"))
-- | Create a new 'ListAssetsResponseBody200' with all required fields.
mkListAssetsResponseBody200 :: Data.Text.Internal.Text -- ^ 'listAssetsResponseBody200Asset_name'
  -> Data.Text.Internal.Text -- ^ 'listAssetsResponseBody200Fingerprint'
  -> Data.Text.Internal.Text -- ^ 'listAssetsResponseBody200Policy_id'
  -> ListAssetsResponseBody200
mkListAssetsResponseBody200 listAssetsResponseBody200Asset_name listAssetsResponseBody200Fingerprint listAssetsResponseBody200Policy_id = ListAssetsResponseBody200{listAssetsResponseBody200Asset_name = listAssetsResponseBody200Asset_name,
                                                                                                                                                                    listAssetsResponseBody200Fingerprint = listAssetsResponseBody200Fingerprint,
                                                                                                                                                                    listAssetsResponseBody200Metadata = GHC.Maybe.Nothing,
                                                                                                                                                                    listAssetsResponseBody200Metadata_error = GHC.Maybe.Nothing,
                                                                                                                                                                    listAssetsResponseBody200Policy_id = listAssetsResponseBody200Policy_id}
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets.GET.responses.200.content.application\/json.schema.items.properties.metadata@ in the specification.
-- 
-- In the Mary era of Cardano, UTxO may contain native assets. These
-- assets are represented on-chain by opaque identifiers which are
-- meaningless to end-users. Therefore, user-facing metadata
-- regarding each token must be stored off-chain, in a metadata
-- registry.
-- 
-- Token creators may publish metadata into the registry and client
-- applications can consume these metadata for display to end
-- users. This will work in a similar way to how it is done for stake
-- pool metadata.
data ListAssetsResponseBody200Metadata = ListAssetsResponseBody200Metadata {
  -- | decimals: Defines a scaling factor for the asset of 10\<sup>-n\<\/sup>. The
  -- decimals value _n_ is therefore the number of digits after the
  -- decimal point for quantities of this token.
  -- 
  -- It is up to API clients to use this metadata field to decimalize
  -- asset quantities before displaying to users. The wallet backend
  -- will always return unscaled token quantities as whole numbers.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maxium  of 255.0
  -- * Minimum  of 0.0
  listAssetsResponseBody200MetadataDecimals :: (GHC.Maybe.Maybe GHC.Types.Int)
  -- | description: A human-readable description for the asset. Good for display in
  -- user interfaces.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 500
  , listAssetsResponseBody200MetadataDescription :: Data.Text.Internal.Text
  -- | logo: A base64-encoded \`image\/png\` for displaying the asset. The end image can be expected
  -- to be smaller than 64KB.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 87400
  , listAssetsResponseBody200MetadataLogo :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | name: A human-readable name for the asset, intended for display in user
  -- interfaces.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 50
  -- * Minimum length of 1
  , listAssetsResponseBody200MetadataName :: Data.Text.Internal.Text
  -- | ticker: An optional human-readable very short name or acronym for the
  -- asset, intended for display in user interfaces. If \`ticker\` is not
  -- present, then \`name\` will be used, but it might be truncated to
  -- fit within the available space.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 5
  -- * Minimum length of 2
  , listAssetsResponseBody200MetadataTicker :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | url: A URL to the policy\'s owner(s) or the entity website in charge of the asset.
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 250
  -- * Must match pattern \'^https:\/\/.+\'
  , listAssetsResponseBody200MetadataUrl :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON ListAssetsResponseBody200Metadata
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("decimals" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataDecimals obj) : ["description" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200MetadataDescription obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("logo" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataLogo obj) : ["name" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200MetadataName obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("ticker" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataTicker obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("url" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataUrl obj) : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("decimals" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataDecimals obj) : ["description" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200MetadataDescription obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("logo" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataLogo obj) : ["name" Data.Aeson.Types.ToJSON..= listAssetsResponseBody200MetadataName obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("ticker" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataTicker obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("url" Data.Aeson.Types.ToJSON..=)) (listAssetsResponseBody200MetadataUrl obj) : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON ListAssetsResponseBody200Metadata
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "ListAssetsResponseBody200Metadata" (\obj -> (((((GHC.Base.pure ListAssetsResponseBody200Metadata GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "decimals")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "description")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "logo")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "ticker")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "url"))
-- | Create a new 'ListAssetsResponseBody200Metadata' with all required fields.
mkListAssetsResponseBody200Metadata :: Data.Text.Internal.Text -- ^ 'listAssetsResponseBody200MetadataDescription'
  -> Data.Text.Internal.Text -- ^ 'listAssetsResponseBody200MetadataName'
  -> ListAssetsResponseBody200Metadata
mkListAssetsResponseBody200Metadata listAssetsResponseBody200MetadataDescription listAssetsResponseBody200MetadataName = ListAssetsResponseBody200Metadata{listAssetsResponseBody200MetadataDecimals = GHC.Maybe.Nothing,
                                                                                                                                                           listAssetsResponseBody200MetadataDescription = listAssetsResponseBody200MetadataDescription,
                                                                                                                                                           listAssetsResponseBody200MetadataLogo = GHC.Maybe.Nothing,
                                                                                                                                                           listAssetsResponseBody200MetadataName = listAssetsResponseBody200MetadataName,
                                                                                                                                                           listAssetsResponseBody200MetadataTicker = GHC.Maybe.Nothing,
                                                                                                                                                           listAssetsResponseBody200MetadataUrl = GHC.Maybe.Nothing}
-- | Defines the enum schema located at @paths.\/wallets\/{walletId}\/assets.GET.responses.200.content.application\/json.schema.items.properties.metadata_error@ in the specification.
-- 
-- If there was an error fetching metadata from the server,
-- this will be set to one of \`fetch\` or \`parse\`, to indicate
-- the kind of error.
data ListAssetsResponseBody200Metadata_error =
   ListAssetsResponseBody200Metadata_errorOther Data.Aeson.Types.Internal.Value -- ^ This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
  | ListAssetsResponseBody200Metadata_errorTyped Data.Text.Internal.Text -- ^ This constructor can be used to send values to the server which are not present in the specification yet.
  | ListAssetsResponseBody200Metadata_errorEnumFetch -- ^ Represents the JSON value @"fetch"@
  | ListAssetsResponseBody200Metadata_errorEnumParse -- ^ Represents the JSON value @"parse"@
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON ListAssetsResponseBody200Metadata_error
    where toJSON (ListAssetsResponseBody200Metadata_errorOther val) = val
          toJSON (ListAssetsResponseBody200Metadata_errorTyped val) = Data.Aeson.Types.ToJSON.toJSON val
          toJSON (ListAssetsResponseBody200Metadata_errorEnumFetch) = "fetch"
          toJSON (ListAssetsResponseBody200Metadata_errorEnumParse) = "parse"
instance Data.Aeson.Types.FromJSON.FromJSON ListAssetsResponseBody200Metadata_error
    where parseJSON val = GHC.Base.pure (if | val GHC.Classes.== "fetch" -> ListAssetsResponseBody200Metadata_errorEnumFetch
                                            | val GHC.Classes.== "parse" -> ListAssetsResponseBody200Metadata_errorEnumParse
                                            | GHC.Base.otherwise -> ListAssetsResponseBody200Metadata_errorOther val)
-- | Defines the object schema located at @paths.\/wallets\/{walletId}\/assets.GET.responses.406.content.application\/json.schema@ in the specification.
-- 
-- 
data ListAssetsResponseBody406 = ListAssetsResponseBody406 {
  -- | message: May occur when providing an invalid \'Accept\' header.
  listAssetsResponseBody406Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON ListAssetsResponseBody406
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= listAssetsResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= listAssetsResponseBody406Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "not_acceptable"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON ListAssetsResponseBody406
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "ListAssetsResponseBody406" (\obj -> GHC.Base.pure ListAssetsResponseBody406 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'ListAssetsResponseBody406' with all required fields.
mkListAssetsResponseBody406 :: Data.Text.Internal.Text -- ^ 'listAssetsResponseBody406Message'
  -> ListAssetsResponseBody406
mkListAssetsResponseBody406 listAssetsResponseBody406Message = ListAssetsResponseBody406{listAssetsResponseBody406Message = listAssetsResponseBody406Message}
-- | > GET /wallets/{walletId}/assets
-- 
-- The same as 'listAssets' but accepts an explicit configuration.
listAssetsWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response ListAssetsResponse) -- ^ Monadic computation which returns the result of the operation
listAssetsWithConfiguration config
                            walletId = GHC.Base.fmap (\response_3 -> GHC.Base.fmap (Data.Either.either ListAssetsResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> ListAssetsResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                      ([ListAssetsResponseBody200]))
                                                                                                                                                                            | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 406) (Network.HTTP.Client.Types.responseStatus response) -> ListAssetsResponse406 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                      ListAssetsResponseBody406)
                                                                                                                                                                            | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_3) response_3) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/assets")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/assets
-- 
-- The same as 'listAssets' but returns the raw 'Data.ByteString.ByteString'.
listAssetsRaw :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
listAssetsRaw walletId = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/assets")) GHC.Base.mempty)
-- | > GET /wallets/{walletId}/assets
-- 
-- The same as 'listAssets' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
listAssetsWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ walletId | Constraints: Maximum length of 40, Minimum length of 40
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
listAssetsWithConfigurationRaw config
                               walletId = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/wallets/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel walletId)) GHC.Base.<> "/assets")) GHC.Base.mempty)
