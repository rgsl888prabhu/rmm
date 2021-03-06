# Copyright (c) 2019-2020, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# cython: profile = False
# distutils: language = c++
# cython: embedsignature = True
# cython: language_level = 3

from libc.stdint cimport uintptr_t
from libcpp cimport bool
from libcpp.utility cimport pair
from libcpp.vector cimport vector

ctypedef pair[const char*, unsigned int] caller_pair


cdef extern from * nogil:

    ctypedef enum cudaError_t "cudaError_t":
        cudaSuccess = 0

    ctypedef void* cudaStream_t "cudaStream_t"

    ctypedef enum cudaMemcpyKind "cudaMemcpyKind":
        cudaMemcpyHostToHost = 0
        cudaMemcpyHostToDevice = 1
        cudaMemcpyDeviceToHost = 2
        cudaMemcpyDeviceToDevice = 3
        cudaMemcpyDefault = 4

    cudaError_t cudaMemcpyAsync(void* dst, const void* src, size_t count,
                                cudaMemcpyKind kind)
    cudaError_t cudaMemcpyAsync(void* dst, const void* src, size_t count,
                                cudaMemcpyKind kind, cudaStream_t stream)
    cudaError_t cudaStreamSynchronize(cudaStream_t stream)
