export class TaskDto {
    id: number;
    status: SimpleDto;
    description: string;
    creator: UserDto;
    executor: UserDto;
    taskType: SimpleDto;
    created: Date;
    closed: Date;
    estimatedDate: Date;

    constructor(values: Object = {}) {
        Object.assign(this, JSON.parse(JSON.stringify(values)));
    }
}


export class SimpleDto {
    label: number;
    value: string;

    constructor(values: Object = {}) {
        Object.assign(this, JSON.parse(JSON.stringify(values)));
    }
}

export class UserDto {
    id: number;
    fName: string;
    lName: string;

    constructor(values: Object = {}) {
        Object.assign(this, JSON.parse(JSON.stringify(values)));
    }
}
