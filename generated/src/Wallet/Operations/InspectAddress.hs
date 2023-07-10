-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}

-- | Contains the different functions to run the operation inspectAddress
module Wallet.Operations.InspectAddress where

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

-- | > GET /addresses/{addressId}
-- 
-- \<p align=\"right\">status: \<strong>stable\<\/strong>\<\/p>
-- 
-- Give useful information about the structure of a given address.
inspectAddress :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ addressId
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response InspectAddressResponse) -- ^ Monadic computation which returns the result of the operation
inspectAddress addressId = GHC.Base.fmap (\response_0 -> GHC.Base.fmap (Data.Either.either InspectAddressResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> InspectAddressResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                  InspectAddressResponseBody200)
                                                                                                                                                                    | (\status_2 -> Network.HTTP.Types.Status.statusCode status_2 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> InspectAddressResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                  InspectAddressResponseBody400)
                                                                                                                                                                    | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_0) response_0) (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/addresses/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel addressId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | Represents a response of the operation 'inspectAddress'.
-- 
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'InspectAddressResponseError' is used.
data InspectAddressResponse =
   InspectAddressResponseError GHC.Base.String -- ^ Means either no matching case available or a parse error
  | InspectAddressResponse200 InspectAddressResponseBody200 -- ^ Ok
  | InspectAddressResponse400 InspectAddressResponseBody400 -- ^ Bad Request
  deriving (GHC.Show.Show, GHC.Classes.Eq)
-- | Defines the object schema located at @paths.\/addresses\/{addressId}.GET.responses.200.content.application\/json.schema@ in the specification.
-- 
-- 
data InspectAddressResponseBody200 = InspectAddressResponseBody200 {
  -- | address_root: Only for \'Icarus\' and \'Byron\' styles.
  inspectAddressResponseBody200Address_root :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | address_style
  , inspectAddressResponseBody200Address_style :: InspectAddressResponseBody200Address_style
  -- | address_type: The raw type field of the address.
  -- 
  -- Details about possible address types are following (refer also to [cddl](https:\/\/github.com\/input-output-hk\/cardano-ledger\/blob\/master\/eras\/alonzo\/test-suite\/cddl-files\/alonzo.cddl)).
  -- 
  -- | address_type | binary prefix  |   Meaning                                                |
  -- | ------------ |:--------------:|:--------------------------------------------------------:|
  -- |      0       |  0000          |   base address: keyhash28,keyhash28                      |
  -- |      1       |  0001          |   base address: scripthash28,keyhash28                   |
  -- |      2       |  0010          |   base address: keyhash28,scripthash28                   |
  -- |      3       |  0011          |   base address: scripthash28,scripthash28                |
  -- |      4       |  0100          |   pointer address: keyhash28, 3 variable length uint     |
  -- |      5       |  0101          |   pointer address: scripthash28, 3 variable length uint  |
  -- |      6       |  0110          |   enterprise address: keyhash28                          |
  -- |      7       |  0111          |   enterprise address: scripthash28                       |
  -- |      8       |  1000          |   byron\/icarus                                           |
  -- |      14      |  1110          |   reward account: keyhash28                              |
  -- |      15      |  1111          |   reward account: scripthash28                           |
  -- 
  -- 
  -- Constraints:
  -- 
  -- * Maxium  of 15.0
  -- * Minimum  of 0.0
  , inspectAddressResponseBody200Address_type :: (GHC.Maybe.Maybe GHC.Types.Int)
  -- | derivation_path: Only for \'Byron\' style.
  , inspectAddressResponseBody200Derivation_path :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | network_tag: Can be null for \'Icarus\' and \'Byron\' styles.
  -- 
  -- Constraints:
  -- 
  -- * Minimum  of 0.0
  , inspectAddressResponseBody200Network_tag :: (GHC.Maybe.Maybe GHC.Types.Int)
  -- | pointer
  , inspectAddressResponseBody200Pointer :: (GHC.Maybe.Maybe InspectAddressResponseBody200Pointer)
  -- | script_hash
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 64
  -- * Minimum length of 64
  , inspectAddressResponseBody200Script_hash :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | script_hash_bech32
  , inspectAddressResponseBody200Script_hash_bech32 :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | spending_key_bech32
  , inspectAddressResponseBody200Spending_key_bech32 :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | spending_key_hash
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 56
  -- * Minimum length of 56
  , inspectAddressResponseBody200Spending_key_hash :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | stake_key_bech32
  , inspectAddressResponseBody200Stake_key_bech32 :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | stake_key_hash
  -- 
  -- Constraints:
  -- 
  -- * Maximum length of 56
  -- * Minimum length of 56
  , inspectAddressResponseBody200Stake_key_hash :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  -- | stake_reference
  , inspectAddressResponseBody200Stake_reference :: InspectAddressResponseBody200Stake_reference
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON InspectAddressResponseBody200
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("address_root" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Address_root obj) : ["address_style" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200Address_style obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("address_type" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Address_type obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("derivation_path" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Derivation_path obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("network_tag" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Network_tag obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("pointer" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Pointer obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("script_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Script_hash obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("script_hash_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Script_hash_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("spending_key_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Spending_key_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("spending_key_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Spending_key_hash obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("stake_key_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Stake_key_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("stake_key_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Stake_key_hash obj) : ["stake_reference" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200Stake_reference obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("address_root" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Address_root obj) : ["address_style" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200Address_style obj] : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("address_type" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Address_type obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("derivation_path" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Derivation_path obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("network_tag" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Network_tag obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("pointer" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Pointer obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("script_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Script_hash obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("script_hash_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Script_hash_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("spending_key_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Spending_key_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("spending_key_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Spending_key_hash obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("stake_key_bech32" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Stake_key_bech32 obj) : Data.Maybe.maybe GHC.Base.mempty (GHC.Base.pure GHC.Base.. ("stake_key_hash" Data.Aeson.Types.ToJSON..=)) (inspectAddressResponseBody200Stake_key_hash obj) : ["stake_reference" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200Stake_reference obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON InspectAddressResponseBody200
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "InspectAddressResponseBody200" (\obj -> ((((((((((((GHC.Base.pure InspectAddressResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "address_root")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "address_style")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "address_type")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "derivation_path")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "network_tag")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "pointer")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "script_hash")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "script_hash_bech32")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "spending_key_bech32")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "spending_key_hash")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "stake_key_bech32")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:! "stake_key_hash")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "stake_reference"))
-- | Create a new 'InspectAddressResponseBody200' with all required fields.
mkInspectAddressResponseBody200 :: InspectAddressResponseBody200Address_style -- ^ 'inspectAddressResponseBody200Address_style'
  -> InspectAddressResponseBody200Stake_reference -- ^ 'inspectAddressResponseBody200Stake_reference'
  -> InspectAddressResponseBody200
mkInspectAddressResponseBody200 inspectAddressResponseBody200Address_style inspectAddressResponseBody200Stake_reference = InspectAddressResponseBody200{inspectAddressResponseBody200Address_root = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Address_style = inspectAddressResponseBody200Address_style,
                                                                                                                                                        inspectAddressResponseBody200Address_type = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Derivation_path = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Network_tag = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Pointer = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Script_hash = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Script_hash_bech32 = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Spending_key_bech32 = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Spending_key_hash = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Stake_key_bech32 = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Stake_key_hash = GHC.Maybe.Nothing,
                                                                                                                                                        inspectAddressResponseBody200Stake_reference = inspectAddressResponseBody200Stake_reference}
-- | Defines the enum schema located at @paths.\/addresses\/{addressId}.GET.responses.200.content.application\/json.schema.properties.address_style@ in the specification.
-- 
-- 
data InspectAddressResponseBody200Address_style =
   InspectAddressResponseBody200Address_styleOther Data.Aeson.Types.Internal.Value -- ^ This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
  | InspectAddressResponseBody200Address_styleTyped Data.Text.Internal.Text -- ^ This constructor can be used to send values to the server which are not present in the specification yet.
  | InspectAddressResponseBody200Address_styleEnumShelley -- ^ Represents the JSON value @"Shelley"@
  | InspectAddressResponseBody200Address_styleEnumIcarus -- ^ Represents the JSON value @"Icarus"@
  | InspectAddressResponseBody200Address_styleEnumByron -- ^ Represents the JSON value @"Byron"@
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON InspectAddressResponseBody200Address_style
    where toJSON (InspectAddressResponseBody200Address_styleOther val) = val
          toJSON (InspectAddressResponseBody200Address_styleTyped val) = Data.Aeson.Types.ToJSON.toJSON val
          toJSON (InspectAddressResponseBody200Address_styleEnumShelley) = "Shelley"
          toJSON (InspectAddressResponseBody200Address_styleEnumIcarus) = "Icarus"
          toJSON (InspectAddressResponseBody200Address_styleEnumByron) = "Byron"
instance Data.Aeson.Types.FromJSON.FromJSON InspectAddressResponseBody200Address_style
    where parseJSON val = GHC.Base.pure (if | val GHC.Classes.== "Shelley" -> InspectAddressResponseBody200Address_styleEnumShelley
                                            | val GHC.Classes.== "Icarus" -> InspectAddressResponseBody200Address_styleEnumIcarus
                                            | val GHC.Classes.== "Byron" -> InspectAddressResponseBody200Address_styleEnumByron
                                            | GHC.Base.otherwise -> InspectAddressResponseBody200Address_styleOther val)
-- | Defines the object schema located at @paths.\/addresses\/{addressId}.GET.responses.200.content.application\/json.schema.properties.pointer@ in the specification.
-- 
-- 
data InspectAddressResponseBody200Pointer = InspectAddressResponseBody200Pointer {
  -- | output_index
  -- 
  -- Constraints:
  -- 
  -- * Minimum  of 0.0
  inspectAddressResponseBody200PointerOutput_index :: GHC.Types.Int
  -- | slot_num
  -- 
  -- Constraints:
  -- 
  -- * Minimum  of 0.0
  , inspectAddressResponseBody200PointerSlot_num :: GHC.Types.Int
  -- | transaction_index
  -- 
  -- Constraints:
  -- 
  -- * Minimum  of 0.0
  , inspectAddressResponseBody200PointerTransaction_index :: GHC.Types.Int
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON InspectAddressResponseBody200Pointer
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["output_index" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerOutput_index obj] : ["slot_num" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerSlot_num obj] : ["transaction_index" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerTransaction_index obj] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["output_index" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerOutput_index obj] : ["slot_num" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerSlot_num obj] : ["transaction_index" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody200PointerTransaction_index obj] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON InspectAddressResponseBody200Pointer
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "InspectAddressResponseBody200Pointer" (\obj -> ((GHC.Base.pure InspectAddressResponseBody200Pointer GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "output_index")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "slot_num")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "transaction_index"))
-- | Create a new 'InspectAddressResponseBody200Pointer' with all required fields.
mkInspectAddressResponseBody200Pointer :: GHC.Types.Int -- ^ 'inspectAddressResponseBody200PointerOutput_index'
  -> GHC.Types.Int -- ^ 'inspectAddressResponseBody200PointerSlot_num'
  -> GHC.Types.Int -- ^ 'inspectAddressResponseBody200PointerTransaction_index'
  -> InspectAddressResponseBody200Pointer
mkInspectAddressResponseBody200Pointer inspectAddressResponseBody200PointerOutput_index inspectAddressResponseBody200PointerSlot_num inspectAddressResponseBody200PointerTransaction_index = InspectAddressResponseBody200Pointer{inspectAddressResponseBody200PointerOutput_index = inspectAddressResponseBody200PointerOutput_index,
                                                                                                                                                                                                                                  inspectAddressResponseBody200PointerSlot_num = inspectAddressResponseBody200PointerSlot_num,
                                                                                                                                                                                                                                  inspectAddressResponseBody200PointerTransaction_index = inspectAddressResponseBody200PointerTransaction_index}
-- | Defines the enum schema located at @paths.\/addresses\/{addressId}.GET.responses.200.content.application\/json.schema.properties.stake_reference@ in the specification.
-- 
-- 
data InspectAddressResponseBody200Stake_reference =
   InspectAddressResponseBody200Stake_referenceOther Data.Aeson.Types.Internal.Value -- ^ This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
  | InspectAddressResponseBody200Stake_referenceTyped Data.Text.Internal.Text -- ^ This constructor can be used to send values to the server which are not present in the specification yet.
  | InspectAddressResponseBody200Stake_referenceEnumNone -- ^ Represents the JSON value @"none"@
  | InspectAddressResponseBody200Stake_referenceEnumBy_value -- ^ Represents the JSON value @"by value"@
  | InspectAddressResponseBody200Stake_referenceEnumBy_pointer -- ^ Represents the JSON value @"by pointer"@
  deriving (GHC.Show.Show, GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON InspectAddressResponseBody200Stake_reference
    where toJSON (InspectAddressResponseBody200Stake_referenceOther val) = val
          toJSON (InspectAddressResponseBody200Stake_referenceTyped val) = Data.Aeson.Types.ToJSON.toJSON val
          toJSON (InspectAddressResponseBody200Stake_referenceEnumNone) = "none"
          toJSON (InspectAddressResponseBody200Stake_referenceEnumBy_value) = "by value"
          toJSON (InspectAddressResponseBody200Stake_referenceEnumBy_pointer) = "by pointer"
instance Data.Aeson.Types.FromJSON.FromJSON InspectAddressResponseBody200Stake_reference
    where parseJSON val = GHC.Base.pure (if | val GHC.Classes.== "none" -> InspectAddressResponseBody200Stake_referenceEnumNone
                                            | val GHC.Classes.== "by value" -> InspectAddressResponseBody200Stake_referenceEnumBy_value
                                            | val GHC.Classes.== "by pointer" -> InspectAddressResponseBody200Stake_referenceEnumBy_pointer
                                            | GHC.Base.otherwise -> InspectAddressResponseBody200Stake_referenceOther val)
-- | Defines the object schema located at @paths.\/addresses\/{addressId}.GET.responses.400.content.application\/json.schema@ in the specification.
-- 
-- 
data InspectAddressResponseBody400 = InspectAddressResponseBody400 {
  -- | message: May occur when a request is not well-formed; that is, it fails to parse
  -- successfully. This could be the case when some required parameters
  -- are missing or, when malformed values are provided.
  inspectAddressResponseBody400Message :: Data.Text.Internal.Text
  } deriving (GHC.Show.Show
  , GHC.Classes.Eq)
instance Data.Aeson.Types.ToJSON.ToJSON InspectAddressResponseBody400
    where toJSON obj = Data.Aeson.Types.Internal.object (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty))
          toEncoding obj = Data.Aeson.Encoding.Internal.pairs (GHC.Base.mconcat (Data.Foldable.concat (["message" Data.Aeson.Types.ToJSON..= inspectAddressResponseBody400Message obj] : ["code" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "bad_request"] : GHC.Base.mempty)))
instance Data.Aeson.Types.FromJSON.FromJSON InspectAddressResponseBody400
    where parseJSON = Data.Aeson.Types.FromJSON.withObject "InspectAddressResponseBody400" (\obj -> GHC.Base.pure InspectAddressResponseBody400 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "message"))
-- | Create a new 'InspectAddressResponseBody400' with all required fields.
mkInspectAddressResponseBody400 :: Data.Text.Internal.Text -- ^ 'inspectAddressResponseBody400Message'
  -> InspectAddressResponseBody400
mkInspectAddressResponseBody400 inspectAddressResponseBody400Message = InspectAddressResponseBody400{inspectAddressResponseBody400Message = inspectAddressResponseBody400Message}
-- | > GET /addresses/{addressId}
-- 
-- The same as 'inspectAddress' but accepts an explicit configuration.
inspectAddressWithConfiguration :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ addressId
  -> m (Network.HTTP.Client.Types.Response InspectAddressResponse) -- ^ Monadic computation which returns the result of the operation
inspectAddressWithConfiguration config
                                addressId = GHC.Base.fmap (\response_3 -> GHC.Base.fmap (Data.Either.either InspectAddressResponseError GHC.Base.id GHC.Base.. (\response body -> if | (\status_4 -> Network.HTTP.Types.Status.statusCode status_4 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) -> InspectAddressResponse200 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   InspectAddressResponseBody200)
                                                                                                                                                                                     | (\status_5 -> Network.HTTP.Types.Status.statusCode status_5 GHC.Classes.== 400) (Network.HTTP.Client.Types.responseStatus response) -> InspectAddressResponse400 Data.Functor.<$> (Data.Aeson.eitherDecodeStrict body :: Data.Either.Either GHC.Base.String
                                                                                                                                                                                                                                                                                                                                                                                                                                   InspectAddressResponseBody400)
                                                                                                                                                                                     | GHC.Base.otherwise -> Data.Either.Left "Missing default response type") response_3) response_3) (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/addresses/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel addressId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | > GET /addresses/{addressId}
-- 
-- The same as 'inspectAddress' but returns the raw 'Data.ByteString.ByteString'.
inspectAddressRaw :: forall m . Wallet.Common.MonadHTTP m => Data.Text.Internal.Text -- ^ addressId
  -> Wallet.Common.ClientT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
inspectAddressRaw addressId = GHC.Base.id (Wallet.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/addresses/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel addressId)) GHC.Base.<> "")) GHC.Base.mempty)
-- | > GET /addresses/{addressId}
-- 
-- The same as 'inspectAddress' but accepts an explicit configuration and returns the raw 'Data.ByteString.ByteString'.
inspectAddressWithConfigurationRaw :: forall m . Wallet.Common.MonadHTTP m => Wallet.Common.Configuration -- ^ The configuration to use in the request
  -> Data.Text.Internal.Text -- ^ addressId
  -> m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.Type.ByteString) -- ^ Monadic computation which returns the result of the operation
inspectAddressWithConfigurationRaw config
                                   addressId = GHC.Base.id (Wallet.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") ("/addresses/" GHC.Base.<> (Wallet.Common.byteToText (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Wallet.Common.textToByte GHC.Base.$ Wallet.Common.stringifyModel addressId)) GHC.Base.<> "")) GHC.Base.mempty)