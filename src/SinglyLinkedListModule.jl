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
    Abstract Node
    """
    abstract type SinglyLinkedListAbstractNode
    end
    
    """
    Empty node (ie end of list)
    """
    struct SinglyLinkedListEmptyNode <: SinglyLinkedListAbstractNode
    end
    
    mutable struct SinglyLinkedListNode <: SinglyLinkedListAbstractNode
        data::Int
        next::SinglyLinkedListAbstractNode

        function SinglyLinkedListNode()
            new_node = new()
            new_node.data = 0
            new_node.next = SinglyLinkedListEmptyNode()
            new_node
        end

        function SinglyLinkedListNode(data, next)
            new_node = SinglyLinkedListNode()
            new_node.data = data
            new_node.next = next
            new_node
        end
    end
    
    mutable struct SinglyLinkedList
        head::SinglyLinkedListAbstractNode
        tail::SinglyLinkedListAbstractNode

        function SinglyLinkedList()
            new_list = new()
            new_list.head = SinglyLinkedListEmptyNode()
            new_list.tail = SinglyLinkedListEmptyNode()
            new_list
        end

        function SinglyLinkedList(head, tail)
            new_list = SinglyLinkedList()
            new_list.head = head
            new_list.tail = tail
            new_list
        end
    end

    """
    Push a new node to the end of the list
    """
    function Base.push!(list::SinglyLinkedList, data::Int)
        new_node = SinglyLinkedListNode(data, SinglyLinkedListEmptyNode())
        
        if (list.head isa SinglyLinkedListEmptyNode)
            list.head = new_node
        else
            list.tail.next = new_node
        end
        list.tail = new_node
    end

    """
    Stringify out the whole list e.g.:
    data1 data2 data3 ...
    """
    function stringify(list::SinglyLinkedList)
        node = list.head
        buffer = IOBuffer()

        while !(node isa SinglyLinkedListEmptyNode)
            node_data = node.data
            if node.next isa SinglyLinkedListEmptyNode
                print(buffer, "$node_data")
            else
                print(buffer, "$node_data ")
            end

            node = node.next
        end

        String(take!(buffer))
    end

end # module SinglyLinkedListModule