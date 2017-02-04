# The protobuf compiler (protoc) causes me some serious headaches. 

mkdir -p ./gen/

protoc \
  --proto_path=./protobufs/ \
  --js_out=import_style=commonjs,binary:./gen/ \
  protobufs/tensor.proto \
  protobufs/types.proto \
  protobufs/tensor_shape.proto
