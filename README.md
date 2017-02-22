# Tensor JS

## About

This library allows you to read and write Tensor protobufs (specifically the
tensors that are used by the Google TensorFlow library). The tensors are encoded/decoded
from multidimensional JS arrays.

## Installation & Building

To install this:

```
$ npm install
```

If you want to rebuild the protobuf implementations, feel free to recompile them
by running (but there *should* be no reason to do this):

```
$ ./compile.sh
```

## Usage

### Writing Tensor Protobufs

#### Function Signature

```
make_tensor(array, type)
```

 - `array`: A multidimensional array representing the tensor you want to encode
 - `type`: One of lib.types.INT or lib.types.FLOAT representing which type of tensor it is
 - `RETURNS`: A string encoding the binary value of the tensor protobuf *(NOTE: There is some nonsense about encoding the strings as UINT8s but JS using utf-16. I think I've solved all the bugs, although it is possible there are still more.)*

#### Example
```
const tensorjs = require('tensorjs');

tensorjs.make_tensor([[1, 2], [3, 4]], tensorjs.types.INT);
// returns '\b\u0003\u0012\b\u0012\u0002\b\u0002\u0012\u0002\b\u0002:\u0004\u0001\u0002\u0003\u0004'
```

#### Convenience Functions

We provide two convenience functions so that you don't have to pass in the type:

```
tensorjs.intTensor([[1, 2], [3, 4]]);
tensorjs.floatTensor([1.5, 2.5]);
```

### Reading Tensor Protobufs

#### Function Signature

```
make_array(tensor_pb)
```

 - `tensor_pb`: A string encoding the tensor protobuf.
 - `RETURNS`: A multidimensional array representing the tensor.

#### Example
```
const tensorjs = require('tensorjs');

tensorjs.make_array('\b\u0003\u0012\b\u0012\u0002\b\u0002\u0012\u0002\b\u0002:\u0004\u0001\u0002\u0003\u0004');
// returns [[1, 2], [3, 4]]
```

## Author & License (MIT)

Copyright (c) 2017 Tomas Reimers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
