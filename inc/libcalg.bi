'' FreeBASIC binding for C Algorithms v1.2.0(master 2025-01-17)
'' This is a collection of common computer science data structures and algorithms which may be used in C projects.
'' based on the C header files:
'The C Algorithms library is made available under the ISC license, 
'a permissive license that is functionally identical to the simplified BSD or MIT licenses.
'Copyright (c) 2005-2008, Simon Howard
'
'Permission to use, copy, modify, and/or distribute this software
'for any purpose with or without fee is hereby granted, provided
'that the above copyright notice and this permission notice appear
'in all copies.
'THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
'WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
'WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
'AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
'CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
'LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
'NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
'CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
'' translated to FreeBASIC by:
''  FreeBASIC development team
#pragma once

#ifndef LIBCALG_H
#define LIBCALG_H
#inclib "calg"

extern "C"

Type ArrayListValue As Any Ptr
type ArrayList as _ArrayList

Type _ArrayList
   data_ as ArrayListValue ptr
   length as ulong
   _alloced as ulong
end type

Type ArrayListEqualFunc As Function(ByVal value1 As ArrayListValue, ByVal value2 As ArrayListValue) As Long
type ArrayListCompareFunc as function(byval value1 as ArrayListValue, byval value2 as ArrayListValue) as long
declare function arraylist_new(byval length as ulong) as ArrayList ptr
declare sub arraylist_free(byval arraylist as ArrayList ptr)
declare function arraylist_append(byval arraylist as ArrayList ptr, byval data_ as ArrayListValue) as long
declare function arraylist_prepend(byval arraylist as ArrayList ptr, byval data_ as ArrayListValue) as long
declare sub arraylist_remove(byval arraylist as ArrayList ptr, byval index as ulong)
declare sub arraylist_remove_range(byval arraylist as ArrayList ptr, byval index as ulong, byval length as ulong)
declare function arraylist_insert(byval arraylist as ArrayList ptr, byval index as ulong, byval data_ as ArrayListValue) as long
declare function arraylist_index_of(byval arraylist as ArrayList ptr, byval callback as ArrayListEqualFunc, byval data_ as ArrayListValue) as long
declare sub arraylist_clear(byval arraylist as ArrayList ptr)
Declare Sub arraylist_sort(ByVal ArrayList As ArrayList Ptr, ByVal compare_func As ArrayListCompareFunc)


type AVLTree as _AVLTree
type AVLTreeKey as any ptr
type AVLTreeValue as any ptr
const AVL_TREE_NULL = cptr(any ptr, 0)
type AVLTreeNode as _AVLTreeNode

type AVLTreeNodeSide as long
enum
   AVL_TREE_NODE_LEFT = 0
   AVL_TREE_NODE_RIGHT = 1
end enum

type AVLTreeCompareFunc as function(byval value1 as AVLTreeKey, byval value2 as AVLTreeKey) as long
declare function avl_tree_new(byval compare_func as AVLTreeCompareFunc) as AVLTree ptr
declare sub avl_tree_free(byval tree as AVLTree ptr)
declare function avl_tree_insert(byval tree as AVLTree ptr, byval key as AVLTreeKey, byval value as AVLTreeValue) as AVLTreeNode ptr
declare sub avl_tree_remove_node(byval tree as AVLTree ptr, byval node as AVLTreeNode ptr)
declare function avl_tree_remove(byval tree as AVLTree ptr, byval key as AVLTreeKey) as long
declare function avl_tree_lookup_node(byval tree as AVLTree ptr, byval key as AVLTreeKey) as AVLTreeNode ptr
declare function avl_tree_lookup(byval tree as AVLTree ptr, byval key as AVLTreeKey) as AVLTreeValue
declare function avl_tree_root_node(byval tree as AVLTree ptr) as AVLTreeNode ptr
declare function avl_tree_node_key(byval node as AVLTreeNode ptr) as AVLTreeKey
declare function avl_tree_node_value(byval node as AVLTreeNode ptr) as AVLTreeValue
declare function avl_tree_node_child(byval node as AVLTreeNode ptr, byval side as AVLTreeNodeSide) as AVLTreeNode ptr
declare function avl_tree_node_parent(byval node as AVLTreeNode ptr) as AVLTreeNode ptr
declare function avl_tree_subtree_height(byval node as AVLTreeNode ptr) as long
declare function avl_tree_to_array(byval tree as AVLTree ptr) as AVLTreeKey ptr
declare function avl_tree_num_entries(byval tree as AVLTree ptr) as ulong


type BinaryHeapType as long
enum
   BINARY_HEAP_TYPE_MIN
   BINARY_HEAP_TYPE_MAX
end enum

type BinaryHeapValue as any ptr
const BINARY_HEAP_NULL = cptr(any ptr, 0)
type BinaryHeapCompareFunc as function(byval value1 as BinaryHeapValue, byval value2 as BinaryHeapValue) as long
type BinaryHeap as _BinaryHeap
declare function binary_heap_new(byval heap_type as BinaryHeapType, byval compare_func as BinaryHeapCompareFunc) as BinaryHeap ptr
declare sub binary_heap_free(byval heap as BinaryHeap ptr)
declare function binary_heap_insert(byval heap as BinaryHeap ptr, byval value as BinaryHeapValue) as long
declare function binary_heap_pop(byval heap as BinaryHeap ptr) as BinaryHeapValue
declare function binary_heap_num_entries(byval heap as BinaryHeap ptr) as ulong


type BinomialHeapType as long
enum
   BINOMIAL_HEAP_TYPE_MIN
   BINOMIAL_HEAP_TYPE_MAX
end enum

type BinomialHeapValue as any ptr
const BINOMIAL_HEAP_NULL = cptr(any ptr, 0)
type BinomialHeapCompareFunc as function(byval value1 as BinomialHeapValue, byval value2 as BinomialHeapValue) as long
type BinomialHeap as _BinomialHeap
declare function binomial_heap_new(byval heap_type as BinomialHeapType, byval compare_func as BinomialHeapCompareFunc) as BinomialHeap ptr
declare sub binomial_heap_free(byval heap as BinomialHeap ptr)
declare function binomial_heap_insert(byval heap as BinomialHeap ptr, byval value as BinomialHeapValue) as long
declare function binomial_heap_pop(byval heap as BinomialHeap ptr) as BinomialHeapValue
declare function binomial_heap_num_entries(byval heap as BinomialHeap ptr) as ulong


type BloomFilter as _BloomFilter
type BloomFilterValue as any ptr
type BloomFilterHashFunc as function(byval data_ as BloomFilterValue) as ulong

declare function bloom_filter_new(byval table_size as ulong, byval hash_func as BloomFilterHashFunc, byval num_functions as ulong) as BloomFilter ptr
declare sub bloom_filter_free(byval bloomfilter as BloomFilter ptr)
declare sub bloom_filter_insert(byval bloomfilter as BloomFilter ptr, byval value as BloomFilterValue)
declare function bloom_filter_query(byval bloomfilter as BloomFilter ptr, byval value as BloomFilterValue) as long
declare sub bloom_filter_read(byval bloomfilter as BloomFilter ptr, byval array as ubyte ptr)
declare sub bloom_filter_load(byval bloomfilter as BloomFilter ptr, byval array as ubyte ptr)
declare function bloom_filter_union(byval filter1 as BloomFilter ptr, byval filter2 as BloomFilter ptr) as BloomFilter ptr
declare function bloom_filter_intersection(byval filter1 as BloomFilter ptr, byval filter2 as BloomFilter ptr) as BloomFilter ptr

declare function int_equal(byval location1 as any ptr, byval location2 as any ptr) as long
declare function int_compare(byval location1 as any ptr, byval location2 as any ptr) as long

declare function pointer_equal(byval location1 as any ptr, byval location2 as any ptr) as long
declare function pointer_compare(byval location1 as any ptr, byval location2 as any ptr) as long

declare function string_equal(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_compare(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_nocase_equal(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_nocase_compare(byval string1 as any ptr, byval string2 as any ptr) as long

declare function int_hash(byval location as any ptr) as ulong

declare function pointer_hash(byval location as any ptr) as ulong

Declare Function string_hash(ByVal String As Any Ptr) As ULong
declare function string_nocase_hash(byval string as any ptr) as ulong


type HashTable as _HashTable
type HashTableIterator as _HashTableIterator
type HashTableEntry as _HashTableEntry
type HashTableKey as any ptr
type HashTableValue as any ptr
const HASH_TABLE_KEY_NULL = cptr(any ptr, 0)
const HASH_TABLE_NULL = cptr(any ptr, 0)

type _HashTablePair
   key as HashTableKey
   value as HashTableValue
end type

type HashTablePair as _HashTablePair

type _HashTableIterator
   hash_table as HashTable ptr
   next_entry as HashTableEntry ptr
   next_chain as ulong
end type

type HashTableHashFunc as function(byval value as HashTableKey) as ulong
type HashTableEqualFunc as function(byval value1 as HashTableKey, byval value2 as HashTableKey) as long
type HashTableKeyFreeFunc as sub(byval value as HashTableKey)
type HashTableValueFreeFunc as sub(byval value as HashTableValue)

declare function hash_table_new(byval hash_func as HashTableHashFunc, byval equal_func as HashTableEqualFunc) as HashTable ptr
declare sub hash_table_free(byval hash_table as HashTable ptr)
declare sub hash_table_register_free_functions(byval hash_table as HashTable ptr, byval key_free_func as HashTableKeyFreeFunc, byval value_free_func as HashTableValueFreeFunc)
declare function hash_table_insert(byval hash_table as HashTable ptr, byval key as HashTableKey, byval value as HashTableValue) as long
declare function hash_table_lookup(byval hash_table as HashTable ptr, byval key as HashTableKey) as HashTableValue
declare function hash_table_remove(byval hash_table as HashTable ptr, byval key as HashTableKey) as long
declare function hash_table_num_entries(byval hash_table as HashTable ptr) as ulong
declare sub hash_table_iterate(byval hash_table as HashTable ptr, byval iter as HashTableIterator ptr)
declare function hash_table_iter_has_more(byval iterator as HashTableIterator ptr) as long
declare function hash_table_iter_next(byval iterator as HashTableIterator ptr) as HashTablePair


type ListEntry as _ListEntry
type ListIterator as _ListIterator
type ListValue as any ptr
const LIST_NULL = cptr(any ptr, 0)

type _ListIterator
   prev_next as ListEntry ptr ptr
   current as ListEntry ptr
end type

type ListCompareFunc as function(byval value1 as ListValue, byval value2 as ListValue) as long
type ListEqualFunc as function(byval value1 as ListValue, byval value2 as ListValue) as long
declare sub list_free(byval list as ListEntry ptr)
declare function list_prepend(byval list as ListEntry ptr ptr, byval data_ as ListValue) as ListEntry ptr
declare function list_append(byval list as ListEntry ptr ptr, byval data_ as ListValue) as ListEntry ptr
declare function list_prev(byval listentry as ListEntry ptr) as ListEntry ptr
declare function list_next(byval listentry as ListEntry ptr) as ListEntry ptr
declare function list_data(byval listentry as ListEntry ptr) as ListValue
declare sub list_set_data(byval listentry as ListEntry ptr, byval value as ListValue)
declare function list_nth_entry(byval list as ListEntry ptr, byval n as ulong) as ListEntry ptr
declare function list_nth_data(byval list as ListEntry ptr, byval n as ulong) as ListValue
declare function list_length(byval list as ListEntry ptr) as ulong
declare function list_to_array(byval list as ListEntry ptr) as ListValue ptr
declare function list_remove_entry(byval list as ListEntry ptr ptr, byval entry as ListEntry ptr) as long
declare function list_remove_data(byval list as ListEntry ptr ptr, byval callback as ListEqualFunc, byval data_ as ListValue) as ulong
declare sub list_sort(byval list as ListEntry ptr ptr, byval compare_func as ListCompareFunc)
declare function list_find_data(byval list as ListEntry ptr, byval callback as ListEqualFunc, byval data_ as ListValue) as ListEntry ptr
declare sub list_iterate(byval list as ListEntry ptr ptr, byval iter as ListIterator ptr)
declare function list_iter_has_more(byval iterator as ListIterator ptr) as long
declare function list_iter_next(byval iterator as ListIterator ptr) as ListValue
declare sub list_iter_remove(byval iterator as ListIterator ptr)

type Queue as _Queue
type QueueValue as any ptr
const QUEUE_NULL = cptr(any ptr, 0)
declare function queue_new() as Queue ptr
declare sub queue_free(byval queue as Queue ptr)
declare function queue_push_head(byval queue as Queue ptr, byval data_ as QueueValue) as long
declare function queue_pop_head(byval queue as Queue ptr) as QueueValue
declare function queue_peek_head(byval queue as Queue ptr) as QueueValue
declare function queue_push_tail(byval queue as Queue ptr, byval data_ as QueueValue) as long
declare function queue_pop_tail(byval queue as Queue ptr) as QueueValue
declare function queue_peek_tail(byval queue as Queue ptr) as QueueValue
declare function queue_is_empty(byval queue as Queue ptr) as long


type RBTree as _RBTree
type RBTreeKey as any ptr
type RBTreeValue as any ptr
const RB_TREE_NULL = cptr(any ptr, 0)
type RBTreeNode as _RBTreeNode
type RBTreeCompareFunc as function(byval data1 as RBTreeKey, byval data2 as RBTreeKey) as long

type RBTreeNodeColor as long
enum
   RB_TREE_NODE_RED
   RB_TREE_NODE_BLACK
end enum

type RBTreeNodeSide as long
enum
   RB_TREE_NODE_LEFT = 0
   RB_TREE_NODE_RIGHT = 1
end enum

declare function rb_tree_new(byval compare_func as RBTreeCompareFunc) as RBTree ptr
declare sub rb_tree_free(byval tree as RBTree ptr)
declare function rb_tree_insert(byval tree as RBTree ptr, byval key as RBTreeKey, byval value as RBTreeValue) as RBTreeNode ptr
declare sub rb_tree_remove_node(byval tree as RBTree ptr, byval node as RBTreeNode ptr)
declare function rb_tree_remove(byval tree as RBTree ptr, byval key as RBTreeKey) as long
declare function rb_tree_lookup_node(byval tree as RBTree ptr, byval key as RBTreeKey) as RBTreeNode ptr
declare function rb_tree_lookup(byval tree as RBTree ptr, byval key as RBTreeKey) as RBTreeValue
declare function rb_tree_root_node(byval tree as RBTree ptr) as RBTreeNode ptr
declare function rb_tree_node_key(byval node as RBTreeNode ptr) as RBTreeKey
declare function rb_tree_node_value(byval node as RBTreeNode ptr) as RBTreeValue
declare function rb_tree_node_child(byval node as RBTreeNode ptr, byval side as RBTreeNodeSide) as RBTreeNode ptr
declare function rb_tree_node_parent(byval node as RBTreeNode ptr) as RBTreeNode ptr
declare function rb_tree_subtree_height(byval node as RBTreeNode ptr) as long
declare function rb_tree_to_array(byval tree as RBTree ptr) as RBTreeKey ptr
declare function rb_tree_num_entries(byval tree as RBTree ptr) as long


type Set as _Set
type SetIterator as _SetIterator
type SetEntry as _SetEntry
type SetValue as any ptr
const SET_NULL = cptr(any ptr, 0)

type _SetIterator
   set as Set ptr
   next_entry as SetEntry ptr
   next_chain as ulong
end type

type SetHashFunc as function(byval value as SetValue) as ulong
type SetEqualFunc as function(byval value1 as SetValue, byval value2 as SetValue) as long
type SetFreeFunc as sub(byval value as SetValue)

Declare Function set_new(ByVal hash_func As SetHashFunc, ByVal equal_func As SetEqualFunc) As Set Ptr
declare sub set_free(byval set as Set ptr)
declare sub set_register_free_function(byval set as Set ptr, byval free_func as SetFreeFunc)
declare function set_insert(byval set as Set ptr, byval data_ as SetValue) as long
Declare Function set_remove(ByVal Set As Set Ptr, ByVal data_ As SetValue) As Long
declare function set_query(byval set as Set ptr, byval data_ as SetValue) as long
Declare Function set_num_entries(ByVal Set As Set Ptr) As ULong
declare function set_to_array(byval set as Set ptr) as SetValue ptr
declare function set_union(byval set1 as Set ptr, byval set2 as Set ptr) as Set ptr
declare function set_intersection(byval set1 as Set ptr, byval set2 as Set ptr) as Set ptr
declare sub set_iterate(byval set as Set ptr, byval iter as SetIterator ptr)
declare function set_iter_has_more(byval iterator as SetIterator ptr) as long
Declare Function set_iter_next(ByVal iterator As SetIterator Ptr) As SetValue


type SListEntry as _SListEntry
type SListIterator as _SListIterator
type SListValue as any ptr
const SLIST_NULL = cptr(any ptr, 0)

type _SListIterator
   prev_next as SListEntry ptr ptr
   current as SListEntry ptr
end type

type SListCompareFunc as function(byval value1 as SListValue, byval value2 as SListValue) as long
type SListEqualFunc as function(byval value1 as SListValue, byval value2 as SListValue) as long
declare sub slist_free(byval list as SListEntry ptr)
declare function slist_prepend(byval list as SListEntry ptr ptr, byval data_ as SListValue) as SListEntry ptr
declare function slist_append(byval list as SListEntry ptr ptr, byval data_ as SListValue) as SListEntry ptr
declare function slist_next(byval listentry as SListEntry ptr) as SListEntry ptr
declare function slist_data(byval listentry as SListEntry ptr) as SListValue
declare sub slist_set_data(byval listentry as SListEntry ptr, byval value as SListValue)
declare function slist_nth_entry(byval list as SListEntry ptr, byval n as ulong) as SListEntry ptr
declare function slist_nth_data(byval list as SListEntry ptr, byval n as ulong) as SListValue
declare function slist_length(byval list as SListEntry ptr) as ulong
declare function slist_to_array(byval list as SListEntry ptr) as SListValue ptr
declare function slist_remove_entry(byval list as SListEntry ptr ptr, byval entry as SListEntry ptr) as long
declare function slist_remove_data(byval list as SListEntry ptr ptr, byval callback as SListEqualFunc, byval data_ as SListValue) as ulong
declare sub slist_sort(byval list as SListEntry ptr ptr, byval compare_func as SListCompareFunc)
declare function slist_find_data(byval list as SListEntry ptr, byval callback as SListEqualFunc, byval data_ as SListValue) as SListEntry ptr
declare sub slist_iterate(byval list as SListEntry ptr ptr, byval iter as SListIterator ptr)
declare function slist_iter_has_more(byval iterator as SListIterator ptr) as long
declare function slist_iter_next(byval iterator as SListIterator ptr) as SListValue
declare sub slist_iter_remove(byval iterator as SListIterator ptr)

type SortedArrayValue as any ptr
const SORTED_ARRAY_NULL = cptr(any ptr, 0)
type SortedArray as _SortedArray
type SortedArrayCompareFunc as function(byval value1 as SortedArrayValue, byval value2 as SortedArrayValue) as long
declare function sortedarray_get(byval array as SortedArray ptr, byval i as ulong) as SortedArrayValue
declare function sortedarray_length(byval array as SortedArray ptr) as ulong
declare function sortedarray_new(byval length as ulong, byval cmp_func as SortedArrayCompareFunc) as SortedArray ptr
declare sub sortedarray_free(byval sortedarray as SortedArray ptr)
declare function sortedarray_remove(byval sortedarray as SortedArray ptr, byval index as ulong) as long
declare function sortedarray_remove_range(byval sortedarray as SortedArray ptr, byval index as ulong, byval length as ulong) as long
declare function sortedarray_insert(byval sortedarray as SortedArray ptr, byval data_ as SortedArrayValue) as long
declare function sortedarray_index_of(byval sortedarray as SortedArray ptr, byval data_ as SortedArrayValue) as long
declare sub sortedarray_clear(byval sortedarray as SortedArray ptr)

type Trie as _Trie
type TrieValue as any ptr
const TRIE_NULL = cptr(any ptr, 0)
declare function trie_new() as Trie ptr
declare sub trie_free(byval trie as Trie ptr)
declare function trie_insert(byval trie as Trie ptr, byval key as zstring ptr, byval value as TrieValue) as long
declare function trie_insert_binary(byval trie as Trie ptr, byval key as ubyte ptr, byval key_length as long, byval value as TrieValue) as long
declare function trie_lookup(byval trie as Trie ptr, byval key as zstring ptr) as TrieValue
declare function trie_lookup_binary(byval trie as Trie ptr, byval key as ubyte ptr, byval key_length as long) as TrieValue
declare function trie_remove(byval trie as Trie ptr, byval key as zstring ptr) as long
declare function trie_remove_binary(byval trie as Trie ptr, byval key as ubyte ptr, byval key_length as long) as long
declare function trie_num_entries(byval trie as Trie ptr) as ulong

end extern
#endif