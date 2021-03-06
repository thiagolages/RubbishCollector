classdef GetIOAnalogInputResponse < robotics.ros.Message
    %GetIOAnalogInputResponse MATLAB implementation of dobot_magician_driver/GetIOAnalogInputResponse
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2019 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'dobot_magician_driver/GetIOAnalogInputResponse' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '6cf698a19a9ab6196e7e59529cfe82b8' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        Value
        Success
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Success', 'Value'} % List of non-constant message properties
        ROSPropertyList = {'success', 'value'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = GetIOAnalogInputResponse(msg)
            %GetIOAnalogInputResponse Construct the message object GetIOAnalogInputResponse
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function value = get.Value(obj)
            %get.Value Get the value for property Value
            value = int32(obj.JavaMessage.getValue);
        end
        
        function set.Value(obj, value)
            %set.Value Set the value for property Value
            validateattributes(value, {'numeric'}, {'nonempty', 'scalar'}, 'GetIOAnalogInputResponse', 'Value');
            
            obj.JavaMessage.setValue(value);
        end
        
        function success = get.Success(obj)
            %get.Success Get the value for property Success
            success = logical(obj.JavaMessage.getSuccess);
        end
        
        function set.Success(obj, success)
            %set.Success Set the value for property Success
            validateattributes(success, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'GetIOAnalogInputResponse', 'Success');
            
            obj.JavaMessage.setSuccess(success);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.Value = obj.Value;
            cpObj.Success = obj.Success;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Value = strObj.Value;
            obj.Success = strObj.Success;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Value = obj.Value;
            strObj.Success = obj.Success;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.dobot_magician_driver.GetIOAnalogInputResponse.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.dobot_magician_driver.GetIOAnalogInputResponse;
            obj.reload(strObj);
        end
    end
end
