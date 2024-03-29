"""
    DataStructuresEasyModule

Module containing "easy" tier data structures questions from HackerRank
"""

module DataStructuresEasyModule

    __precompile__(true)

    using ..SinglyLinkedListModule: SinglyLinkedList, SinglyLinkedListEmptyNode, stringify

    """
        rotateLeft(d, arr)

    A left rotation operation on an array of size `n` shifts each of the array's elements 1 unit 
    to the left. Given an integer, `d`, rotate the array that many steps left and return the result.

    # Arguments
    - `d` = number of 1-step rotations to the left
    - `arr` = the array to rotate

    # Output
    The rotated array.
    """
    function rotateLeft(d, arr)
        arr_len = length(arr)

        # Find the start index of the rotated array:
        # it will be the start of the unrotated arr + offset accounting for
        # wrap-round
        start_offset = d % arr_len
        rotated_arr_start = 1 + start_offset

        # Knowing the rotated start index, we just partition the original array in 2
        # and return the concatenation
        vcat(arr[rotated_arr_start:arr_len], arr[1:rotated_arr_start-1])
    end

    """
        deleteNode(llist, position)

    Delete the node at a given position in a linked list. The head is at position 0. 
    The list may be empty after you delete the node.

    # Arguments
    - `llist` = the singly linked list
    - `position` = position of the node to be deleted (0-indexed)

    # Output
    NA
    """
    function deleteNode(llist, position)
        # Empty list
        (llist.head isa SinglyLinkedListEmptyNode) && return

        # Deleting head of list
        if position == 0
            if llist.tail == llist.head
                # Only 1 element in list so set both tail and head
                llist.head = llist.head.next
                llist.tail = llist.head
            else
                llist.head = llist.head.next
            end
            return
        end

        # Go to the position of deletion while keeping
        # hold of the previous node (singly linked list so no back reference)
        back_node = llist.head # 0
        node = llist.head.next # 1
        for i = 2:position
            node = node.next
            back_node = back_node.next
            # Asked to delete past the end of the list?
            (node isa SinglyLinkedListEmptyNode) && return
        end

        # Delete node by rewiring back_node
        back_node.next = node.next
        if llist.tail == node
            # Case where we deleted last node -> need to update tail
            llist.tail = back_node
        end
    end

end # module DataStructuresEasyModule