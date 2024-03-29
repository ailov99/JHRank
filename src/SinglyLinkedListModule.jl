"""
    SinglyLinkedListModule

This is a basic implementation of singly linked list for the purpose of implementing
Hackerrank problem solutions.
Only methods that are needed for a particular solution will be implemented.
"""

module SinglyLinkedListModule

    __precompile__(true)

    export SinglyLinkedListNode, SinglyLinkedList, push!, stringify

    """
    List node
    """
    mutable struct SinglyLinkedListNode{T}
        data::T
        next::SinglyLinkedListNode{T}

        function SinglyLinkedListNode{T}() where T
            new_node = new{T}()
            new_node.next = new_node
            new_node
        end

        function SinglyLinkedListNode{T}(data) where T
            new_node = new{T}(data)
            new_node.next = new_node
            new_node
        end
    end

    """
    The list
    """
    mutable struct SinglyLinkedList{T}
        length::Int
        tail::SinglyLinkedListNode{T}

        function SinglyLinkedList{T}() where T
            new_list = new{T}()
            new_list.length = 0
            new_list.tail = SinglyLinkedListNode{T}()
            new_list
        end
    end

    """
    Push a new node to the end of the list
    """
    function Base.push!(list::SinglyLinkedList{T}, data::T) where T
        new_node = SinglyLinkedListNode{T}(data)
        
        # First node in list is always going to be empty (the root)
        # So we just append this one as the tail
        list.tail.next = new_node
        list.length += 1
    end

    """
    Stringify out the whole list e.g.:
    data1 data2 data3 ...
    """
    function stringify(list::SinglyLinkedList{T}) where T
        node = list.tail

        buffer = IOBuffer()
        for i = 1:list.length
            node = node.next
            node_data = node.data
            if i == list.length
                print(buffer, "$node_data")
            else
                print(buffer, "$node_data ")
            end
        end

        String(take!(buffer))
    end

end # module SinglyLinkedListModule